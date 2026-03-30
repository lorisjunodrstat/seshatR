#' @import ggplot2
#' @import sf
#' @import rnaturalearth
#' @export
plot_seshat_map <- function(data) {
  # 1. On extrait les coordonnees du sous-data.frame
  # On convertit en numerique car l'API les envoie souvent en texte (chr)
  lons <- as.numeric(data$home_nga$longitude)
  lats <- as.numeric(data$home_nga$latitude)
  names_polity <- data$long_name

  # 2. On cree un petit tableau propre pour ggplot
  map_df <- data.frame(lon = lons, lat = lats, label = names_polity)

  # 3. Fond de carte
  world <- rnaturalearth::ne_countries(scale = "medium", returnclass = "sf")

  # 4. Affichage
  ggplot(data = world) +
    geom_sf(fill = "antiquewhite1", color = "gray80") +
    geom_point(data = map_df, aes(x = lon, y = lat), color = "darkred", size = 2) +
    theme_minimal() +
    labs(title = "Localisation des entites Seshat (API)",
         subtitle = paste(nrow(map_df), "sites affiches"),
         x = "Longitude", y = "Latitude")
}
