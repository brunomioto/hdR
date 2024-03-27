#' Retrieves country indicators data from HDR Data API
#'
#' This function retrieves country indicators data from the HDR Data API based on the specified country and year.
#'
#' @param country A character string specifying the country ISO code for which indicators data is requested.
#' @param year An integer specifying the year for which indicators data is requested.
#' @return A data frame containing the country indicators data.
#' @export
#' @importFrom httr2 request req_headers req_url_query req_perform resp_body_json
#' @importFrom dplyr bind_rows
#' @examples
#' \dontrun{
#' country_indicators("BRA", 2010, "hdi")
#' }
country_indicators <- function(country = NULL,
                               year = NULL,
                               indicator = NULL) {

  if(is.null(c(country, year, indicator))){
    cli::cli_abort("Please, enter a valid {.pkg country}, {.pkg year} or {.pkg indicator}")
  }

  url <- "https://api.hdrdata.org/CountryIndicators/filter"

  req <- httr2::request(url)

  resp <- req %>%
    httr2::req_headers("Accept" = "application/json") %>%
    httr2::req_url_query(country = country,
                         year = year,
                         indicator = indicator) %>%
    httr2::req_perform() %>%
    httr2::resp_body_json()

  resp_df <- dplyr::bind_rows(resp) %>%
    dplyr::mutate(year = as.numeric(year),
                  value = as.numeric(value))

  return(resp_df)

}
