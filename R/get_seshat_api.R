#' Recuperer des donnees via l'API Seshat
#' @param endpoint Le nom de la categorie (ex: "core/polities")
#' @importFrom jsonlite fromJSON
#' @export
get_seshat_api <- function(endpoint = "core/polities") {
  base_url <- "https://seshat-db.com/api/"
  target_url <- paste0(base_url, endpoint, "/")

  message("Interrogation de l'API : ", target_url)

  # L'API est paginee, on recupere la premiere page
  response <- jsonlite::fromJSON(target_url)

  # Les donnees sont generalement dans l'element "results"
  df <- response$results

  # Si l'API indique une page suivante, on pourrait boucler,
  # mais commencons par tester la structure
  return(df)
}
