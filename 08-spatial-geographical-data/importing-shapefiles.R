#' # Importing shapefiles

options(width=100)

#' The data used here are available from [Upsala Conflict Data Program](https://ucdp.uu.se/downloads/index.html#ged_polygons).

# To download the data, use the *R*-code 
#
# download.file("https://ucdp.uu.se/downloads/ged/ucdp-ged-poly-v-1-1-shape.zip",
#               "ucdp-ged-poly-v-1-1-shape.zip")

unzip("ucdp-ged-poly-v-1-1-shape.zip",list=TRUE)

unzip("ucdp-ged-poly-v-1-1-shape.zip",
      files=c(
          "UCDPGEDpoly.shx",
          "UCDPGEDpoly.shp",
          "UCDPGEDpoly.dbf"
          ))

#' The following makes use of the *sf* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=sf) using the code
#' `install.packages("sf")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

library(sf)
# All three of the following lines are equivalent:
UCDPGEDpoly <- st_read("UCDPGEDpoly.shx")

UCDPGEDpoly <- st_read("UCDPGEDpoly.shp")

UCDPGEDpoly <- st_read("UCDPGEDpoly.dbf")

str(UCDPGEDpoly)

print(UCDPGEDpoly[c(7,18,20)])
