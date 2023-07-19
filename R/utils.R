parse_documents <- function(documents){
  documents %>% #bashR::simule_map(1)
    purrr::imap_dfr(~{
      # print(.y)
      .x %>%
        purrr::imap_dfc(~{
          if(.y %in% c("deskriptor", "vorgangsbezug", "autoren_anzeige", "urheber", "ressort", "person_roles",
                       "inkrafttreten", "verkuendung", "vorgang_verlinkung",
                       "ueberweisung", "aktivitaet_anzeige", "beschlussfassung")){
            dt <- .x %>%
              purrr::compact() %>%
              purrr::map_dfr(~{
                .x %>%
                  purrr::imap_dfc(~tibble::tibble(!!.y := .x))
              })

            tibble::tibble(!!.y := list(dt))
          } else if(.y == "fundstelle"){
            dt <- .x %>%
              purrr::compact() %>%
              purrr::imap_dfc(~tibble::tibble(!!.y := .x))
            tibble::tibble(!!.y := list(dt))
          } else if(.y %in% c("sachgebiet", "initiative", "zustimmungsbeduerftigkeit")){
            tibble::tibble(!!.y := list(tibble::tibble(!!.y := as.character(.x))))
          } else {
            tibble::tibble(!!.y := .x)
          }
        })
    })
}

shape_url <- function(type,
                      id = NULL,
                      start_date = NULL, end_date = NULL, drucksache = NULL,
                      plenarprotokoll = NULL, vorgang = NULL,
                      zuordnung = NULL, api_token){

  url <- glue::glue("https://search.dip.bundestag.de/api/v1/{type}?")

  if(length(id) > 50){
    warning("You provided more than 50 ids, only the first 50 will be queried")
    id <- id[1:50]
  }

  if(length(vorgang) > 50){
    warning("You provided more than 50 vorgang_ids, only the first 50 will be queried")
    vorgang <- vorgang[1:50]
  }

  if(!is.null(id)) url <- paste0(url, paste0("f.id=", id, "&", collapse = ""))
  if(!is.null(start_date)) url <- paste0(url, "f.datum.start=", start_date, "&")
  if(!is.null(end_date)) url <- paste0(url, "f.datum.end=", end_date, "&")
  if(!is.null(drucksache)) url <- paste0(url, "f.drucksache=", drucksache, "&")
  if(!is.null(plenarprotokoll)) url <- paste0(url, "f.plenarprotokoll=", plenarprotokoll, "&")
  if(!is.null(vorgang)) url <- paste0(url, paste0("f.vorgang=", vorgang, "&", collapse = ""))
  if(!is.null(zuordnung)) url <- paste0(url, "f.zuordnung=", zuordnung, "&")

  url <- paste0(url, "apikey=", api_token)

  return(url)
}


get_documents <- function(type = "vorgang", n_max = 200, api_token = NULL, quiet = F, ...){

  if(is.null(api_token)){
    api_token <- bundestag_key()
  }

  keep_searching <- T
  last_cursor <- ""
  index <- 1
  documents <- list()
  n_total <- 0

  url <- base_url <- shape_url(type = type, api_token = api_token,
                               # start_date, end_date,
                               ...)

  while(keep_searching){

    req <- httr::GET(url)
    out <- httr::content(req)
    if(req$status_code != 200){
      if(req$status_code == 401) message("You API key seems wrong. Please verify it.")
      if(req$status_code == 500) message("The query parameters you provided were incorrect. Please check.")
      if(req$status_code == 503) message("Service unavailable")
      if(is.null(out[["message"]])) out[["message"]] <- ""
      warning(glue::glue("[{req$status_code}] - {out$message}"))
      break
    }

    if(index == 1){
      if(!quiet){
        cli::cli_alert_success("Total number of retrievable units: {out$numFound} (Maximum set to {n_max})")
        id <- cli::cli_status("")
      }
    }

    if(!quiet) cli::cli_status_update(id, "Retrieved {n_total} documents")

    documents[[index]] <- tryCatch({
      # print(url)
      out$documents %>%
        parse_documents()
    },
    error = function(e){
      warning(glue::glue("Parsing error for query {url}"))
      return(tibble::tibble())
    })
    n_total <- n_total + length(out$documents)

    if(n_total >= n_max | last_cursor == out$cursor){
      if(!quiet) cli::cli_status_update(id, "Done")
      keep_searching <- F
    } else {
      last_cursor <- out$cursor
      url <- glue::glue("{base_url}&cursor={stringr::str_replace_all(out$cursor, '\\\\+', '%2b')}")

    }


    index <- index + 1
  }

  if(n_total == 0){
    if(!quiet) cli::cli_alert_success("Unable to retrieve documents")
  } else {
    if(!quiet) cli::cli_alert_success("Successfully retrieved {n_total} documents")
    final <- documents %>%
      purrr::reduce(dplyr::bind_rows)

    return(final)
  }

}

bundestag_key <- function() {
  key <- Sys.getenv("BUNDESTAG_API")
  if (key == "") {
    stop("API key not found. Please make sure you provided the key or set the environment variable 'BUNDESTAG_API'")
  }
  key
}

