#' # Importing geographical data from OpenStreetMap 

#' The following makes use of the *sf* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=sf) using the code
#' `install.packages("sf")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

library(sf)

#' The file used here was extracted by hand from http://www.openstreetmap.org. It is available from [here](http://github.com/melff/dataman-r/raw/main/08-spatial-geographical-data/stpauls.osm).

st_layers("stpauls.osm")

stpauls_lines <- read_sf("stpauls.osm",layer="lines")

stpauls_polygons <- read_sf("stpauls.osm",layer="multipolygons")

# Plotting the polygons ...
plot(st_geometry(stpauls_polygons),
     col="gray80",
     xlim=c(-0.1,-0.097),
     ylim=c(51.5135,51.514)
     )
# and adding the lines
plot(st_geometry(stpauls_lines),add=TRUE)
