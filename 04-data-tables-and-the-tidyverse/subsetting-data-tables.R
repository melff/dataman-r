#' # Subsetting data tables

#' The following makes use of the *data.table* package. You may need to install it
#' from [CRAN](https://cran.r-project.org/package=data.table) using the code
#' `install.packages("data.table")` if you want to run this on your computer. (The package is already installed on
#' the notebook container, however.)

library(data.table)

load("bes2010feelings.RData")
setDT(bes2010feelings)

sctl2010feelings <- bes2010feelings[region=="Scotland"]
head(sctl2010feelings)

bes2010feelings.srtd <- bes2010feelings[order(wave,region)]

bes2010feelings.sub <- bes2010feelings[,.(flng.brown,wave,region)]
names(bes2010feelings.sub)

str(bes2010feelings.sub)

head(bes2010feelings.sub)

sctl2010feelings <- bes2010feelings[region=="Scotland",
                                    .(wave,
                                      flng.brown,
                                      flng.cameron,
                                      flng.clegg,
                                      flng.salmond)]
str(sctl2010feelings)

head(sctl2010feelings)
