#' tidybt_vorgang
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired "vorgang"
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @param drucksache Id of drucksache related to the desired vorgang
#' @export
tidybt_vorgang <- function(n_max = 200, api_token,
                           id = NULL,
                           start_date = NULL, end_date = NULL, drucksache = NULL,
                           plenarprotokoll = NULL, vorgang = NULL,
                           zuordnung = NULL){

  get_documents(type = "vorgang", n_max = n_max, api_token = api_token,
                id = id,
                start_date = start_date, end_date = end_date, drucksache = drucksache,
                plenarprotokoll = plenarprotokoll, vorgang = vorgang,
                zuordnung = zuordnung)
}

#' tidybt_vorgangsposition
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired "vorgangsposition"
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @param drucksache Id of drucksache related to the desired vorgangsposition
#' @export
tidybt_vorgangsposition <- function(n_max = 200, api_token,
                                    id = NULL,
                                    start_date = NULL, end_date = NULL, drucksache = NULL,
                                    plenarprotokoll = NULL, vorgang = NULL,
                                    zuordnung = NULL){

  get_documents(type = "vorgangsposition", n_max = n_max, api_token = api_token,
                id = id,
                start_date = start_date, end_date = end_date, drucksache = drucksache,
                plenarprotokoll = plenarprotokoll, vorgang = vorgang,
                zuordnung = zuordnung)
}

#' tidybt_aktivitaet
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired activity
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @param drucksache Id of drucksache related to the desired activity
#' @export
tidybt_aktivitaet <- function(n_max = 200, api_token,
                              id = NULL,
                              start_date = NULL, end_date = NULL, drucksache = NULL,
                              plenarprotokoll = NULL, vorgang = NULL,
                              zuordnung = NULL){

  get_documents(type = "aktivitaet", n_max = n_max, api_token = api_token,
                id = id,
                start_date = start_date, end_date = end_date, drucksache = drucksache,
                plenarprotokoll = plenarprotokoll, vorgang = vorgang,
                zuordnung = zuordnung)
}

#' tidybt_drucksache
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired "drucksache"
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @export
tidybt_drucksache <- function(n_max = 200, api_token,
                              id = NULL,
                              start_date = NULL, end_date = NULL, drucksache = NULL,
                              plenarprotokoll = NULL, vorgang = NULL,
                              zuordnung = NULL){

  get_documents(type = "drucksache", n_max = n_max, api_token = api_token,
                id = id,
                start_date = start_date, end_date = end_date, drucksache = drucksache,
                plenarprotokoll = plenarprotokoll, vorgang = vorgang,
                zuordnung = zuordnung)
}

#' tidybt_drucksache_text
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired "drucksache"
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @export
tidybt_drucksache_text <- function(n_max = 200, api_token,
                                   id = NULL,
                                   start_date = NULL, end_date = NULL, drucksache = NULL,
                                   plenarprotokoll = NULL, vorgang = NULL,
                                   zuordnung = NULL){

  get_documents(type = "drucksache-text", n_max = n_max, api_token = api_token,
                id = id,
                start_date = start_date, end_date = end_date, drucksache = drucksache,
                plenarprotokoll = plenarprotokoll, vorgang = vorgang,
                zuordnung = zuordnung)
}

#' tidybt_person
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired person
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @param drucksache Id of drucksache related to the desired person
#' @export
tidybt_person <- function(n_max = 200, api_token,
                          id = NULL,
                          start_date = NULL, end_date = NULL, drucksache = NULL,
                          plenarprotokoll = NULL, vorgang = NULL,
                          zuordnung = NULL){

  get_documents(type = "person", n_max = n_max, api_token = api_token,
                id = id,
                start_date = start_date, end_date = end_date, drucksache = drucksache,
                plenarprotokoll = plenarprotokoll, vorgang = vorgang,
                zuordnung = zuordnung)
}

#' tidybt_plenarprotokoll
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired plenary protocol
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @param drucksache Id of drucksache related to the plenarprotokoll
#' @export
tidybt_plenarprotokoll <- function(n_max = 200, api_token,
                                   id = NULL,
                                   start_date = NULL, end_date = NULL, drucksache = NULL,
                                   plenarprotokoll = NULL, vorgang = NULL,
                                   zuordnung = NULL){

  get_documents(type = "plenarprotokoll", n_max = n_max, api_token = api_token,
                id = id,
                start_date = start_date, end_date = end_date, drucksache = drucksache,
                plenarprotokoll = plenarprotokoll, vorgang = vorgang,
                zuordnung = zuordnung)
}

#' tidybt_plenarprotokoll_text
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired plenary protocol
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @param drucksache Id of drucksache related to the plenarprotokoll
#' @export
tidybt_plenarprotokoll_text <- function(n_max = 200, api_token,
                                        id = NULL,
                                        start_date = NULL, end_date = NULL, drucksache = NULL,
                                        plenarprotokoll = NULL, vorgang = NULL,
                                        zuordnung = NULL){

  get_documents(type = "plenarprotokoll-text", n_max = n_max, api_token = api_token,
                id = id,
                start_date = start_date, end_date = end_date, drucksache = drucksache,
                plenarprotokoll = plenarprotokoll, vorgang = vorgang,
                zuordnung = zuordnung)
}

