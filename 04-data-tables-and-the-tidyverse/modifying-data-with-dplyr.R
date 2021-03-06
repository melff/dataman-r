#' # Modifying data with the *dplyr* package

#' The following makes use of the *dplyr* package. You may need to install it
#' from [CRAN](https://cran.r-project.org/package=dplyr) using the code
#' `install.packages("dplyr")` if you want to run this on your computer. (The package is already installed on
#' the notebook container, however.)

library(dplyr)

UK <- data.frame(
           Population = c(55619400,1885400,5424800,3125000),
           Area = c(50301,5460,30090,8023),
           GVA = c(28096,20000,24800,19900),
           country = c("England",
                         "Northern Ireland",
                         "Scotland",
                         "Wales"))

UK %>% mutate(Density = Population/Area)

#' Equivalent code using 'base' R:

within(UK, Density <- Population/Area)
