#' bt_vorgang
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired "vorgang"
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @param drucksache Id of drucksache related to the desired vorgang
#' @param plenarprotokoll Id of plenarprotokoll related to the desired vorgang
#' @param zuordnung One of `c('BT', 'BR', 'BV', 'EK')` depending on institution issuing the desired vorgang
#' @return a `tibble`
#' @examples
#' \dontrun{
#' ## Get some vorgänge
#' bt_vorgang(n_max = 200, api_token)
#' }
#' @export
bt_vorgang <- function(n_max = 100, api_token,
                       id = NULL,
                       start_date = NULL, end_date = NULL, drucksache = NULL,
                       plenarprotokoll = NULL,
                       zuordnung = NULL){

  get_documents(type = "vorgang", n_max = n_max, api_token = api_token,
                id = id,
                start_date = start_date, end_date = end_date, drucksache = drucksache,
                plenarprotokoll = plenarprotokoll,
                zuordnung = zuordnung)
}

#' bt_vorgangsposition
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired "vorgangsposition"
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @param drucksache Id of drucksache related to the desired vorgangsposition
#' @param plenarprotokoll Id of plenarprotokoll related to the desired vorgangsposition
#' @param vorgang Id of vorgang related to the desired vorgangsposition
#' @param zuordnung One of `c('BT', 'BR', 'BV', 'EK')` depending on institution issuing the desired vorgangsposition
#' @return a `tibble`
#' @examples
#' \dontrun{
#' ## Get some vorgänge
#' bt_vorgangsposition(n_max = 200, api_token)
#' }
#' @export
bt_vorgangsposition <- function(n_max = 100, api_token,
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

#' bt_aktivitaet
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired activity
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @param drucksache Id of drucksache related to the desired activity
#' @param plenarprotokoll Id of plenarprotokoll related to the desired activity
#' @param vorgang Id of vorgang related to the desired activity
#' @param zuordnung One of `c('BT', 'BR', 'BV', 'EK')` depending on institution issuing the desired activity
#' @return a `tibble`
#' @examples
#' \dontrun{
#' ## Get some vorgänge
#' bt_aktivitaet(n_max = 200, api_token)
#' }
#' @export
bt_aktivitaet <- function(n_max = 100, api_token,
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

#' bt_drucksache
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired "drucksache"
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @param plenarprotokoll Id of plenarprotokoll related to the desired drucksache
#' @param vorgang Id of vorgang related to the desired drucksache
#' @param zuordnung One of `c('BT', 'BR', 'BV', 'EK')` depending on institution issuing the desired drucksache
#' @return a `tibble`
#' @examples
#' \dontrun{
#' ## Get some vorgänge
#' bt_drucksache(n_max = 200, api_token)
#' }
#' @export
bt_drucksache <- function(n_max = 100, api_token,
                          id = NULL,
                          start_date = NULL, end_date = NULL,
                          plenarprotokoll = NULL, vorgang = NULL,
                          zuordnung = NULL){

  get_documents(type = "drucksache", n_max = n_max, api_token = api_token,
                id = id,
                start_date = start_date, end_date = end_date,
                plenarprotokoll = plenarprotokoll, vorgang = vorgang,
                zuordnung = zuordnung)
}

#' bt_drucksache_text
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired "drucksache"
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @param plenarprotokoll Id of plenarprotokoll related to the desired drucksache
#' @param vorgang Id of vorgang related to the desired drucksache
#' @param zuordnung One of `c('BT', 'BR', 'BV', 'EK')` depending on institution issuing the desired drucksache
#' @return a `tibble`
#' @examples
#' \dontrun{
#' ## Get some vorgänge
#' bt_drucksache_text(n_max = 200, api_token)
#' }
#' @export
bt_drucksache_text <- function(n_max = 100, api_token,
                               id = NULL,
                               start_date = NULL, end_date = NULL,
                               plenarprotokoll = NULL, vorgang = NULL,
                               zuordnung = NULL){

  get_documents(type = "drucksache-text", n_max = n_max, api_token = api_token,
                id = id,
                start_date = start_date, end_date = end_date,
                plenarprotokoll = plenarprotokoll, vorgang = vorgang,
                zuordnung = zuordnung)
}

#' bt_person
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired person
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @param drucksache Id of drucksache related to the desired person
#' @param plenarprotokoll Id of plenarprotokoll related to the desired person
#' @param vorgang Id of vorgang related to the desired person
#' @param zuordnung One of `c('BT', 'BR', 'BV', 'EK')` depending on institution related to the desired person
#' @return a `tibble`
#' @examples
#' \dontrun{
#' ## Get some vorgänge
#' bt_person(n_max = 200, api_token)
#' }
#' @export
bt_person <- function(n_max = 100, api_token,
                      id = NULL,
                      start_date = NULL, end_date = NULL, drucksache = NULL,
                      plenarprotokoll = NULL, vorgang = NULL,
                      zuordnung = NULL){

  get_documents(type = "person", n_max = n_max, api_token = api_token,
                id = id,
                start_date = start_date, end_date = end_date, drucksache = drucksache,
                vorgang = vorgang,
                zuordnung = zuordnung)
}

#' bt_plenarprotokoll
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired plenary protocol
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @param drucksache Id of drucksache related to the plenarprotokoll
#' @param vorgang Id of vorgang related to the desired plenarprotokoll
#' @param zuordnung One of `c('BT', 'BR', 'BV', 'EK')` depending on institution related to the desired plenarprotokoll
#' @return a `tibble`
#' @examples
#' \dontrun{
#' ## Get some vorgänge
#' bt_plenarprotokoll(n_max = 200, api_token)
#' }
#' @export
bt_plenarprotokoll <- function(n_max = 100, api_token,
                               id = NULL,
                               start_date = NULL, end_date = NULL, drucksache = NULL,
                               vorgang = NULL,
                               zuordnung = NULL){

  get_documents(type = "plenarprotokoll", n_max = n_max, api_token = api_token,
                id = id,
                start_date = start_date, end_date = end_date, drucksache = drucksache,
                vorgang = vorgang, zuordnung = zuordnung)
}

#' bt_plenarprotokoll_text
#' @param n_max Maximum of units, that will be retrieved
#' @param api_token Api key as provided by the bundestag service. More info on https://dip.bundestag.de/%C3%BCber-dip/hilfe/api
#' @param id Id of the desired plenary protocol
#' @param start_date Start of the desired period (format is YYYY/MM/DD)
#' @param end_date End of the desired period (format is YYYY/MM/DD)
#' @param drucksache Id of drucksache related to the plenarprotokoll
#' @param vorgang Id of vorgang related to the desired plenarprotokoll
#' @param zuordnung One of `c('BT', 'BR', 'BV', 'EK')` depending on institution related to the desired plenarprotokoll
#' @return a `tibble`
#' @examples
#' \dontrun{
#' ## Get some vorgänge
#' bt_plenarprotokoll_text(n_max = 200, api_token)
#' }
#' @export
bt_plenarprotokoll_text <- function(n_max = 100, api_token,
                                    id = NULL,
                                    start_date = NULL, end_date = NULL, drucksache = NULL,
                                    vorgang = NULL,
                                    zuordnung = NULL){

  get_documents(type = "plenarprotokoll-text", n_max = n_max, api_token = api_token,
                id = id,
                start_date = start_date, end_date = end_date, drucksache = drucksache,
                vorgang = vorgang,
                zuordnung = zuordnung)
}

