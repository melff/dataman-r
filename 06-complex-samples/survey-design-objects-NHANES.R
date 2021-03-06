#' # Constructing a survey design object from a data frame

#' First we activate the *survey* package. You may need to install it from [CRAN](https://cran.r-project.org/package=survey) using the code `install.packages("survey")` before this if you try running this on your computer. (Package is already installed on the notebook container, however.)

library(survey)

#' Next we make the `NHANES` data set available (which comes with the *survey*
#' package)

data(nhanes)

#' Now we can take a look at the data set, it has 7 variables and 8581 observations

head(nhanes)

nrow(nhanes)

#' According to the documentation, the primary sampling units are identified by
#' the variable `SDMVPSU`, the strata from which the PSUs are drawn are
#' identified by the variable `SDMVSTRA`, and the sample weights are `WTMEC2YR`.
#' The sum of the sample weights corresponds to the population size:

with(nhanes,sum(WTMEC2YR))

#' Here were create "ordinary" sampling weights as they are common in social
#' science data sets:

nhanes <- within(nhanes,{
    smplw <- WTMEC2YR/sum(WTMEC2YR)*nrow(nhanes)
})

#' We now create two survey design objects, one with the "population size"
#' weights and one with the "sample size" weights:

design_pop <- svydesign(id = ~SDMVPSU, strata = ~SDMVSTRA,
                            weights = ~WTMEC2YR, data = nhanes)

#' First attempt fails: the cluster numbers are not nested in the strata.
#' We try again with `nest = TRUE`

design_pop <- svydesign(id = ~SDMVPSU, strata = ~SDMVSTRA,
                        weights = ~WTMEC2YR, data = nhanes,
                        nest = TRUE)
design_smpl <- svydesign(id = ~SDMVPSU, strata = ~SDMVSTRA,
                         weights = ~smplw, data = nhanes,
                         nest = TRUE)

#' We first estimate the population proportions with high cholesterol `(HI_CHOL==1)`

svymean(~HI_CHOL, design=design_pop, na.rm=TRUE)

svymean(~HI_CHOL, design=design_smpl, na.rm=TRUE)

#' We secondly estimate the number of those with high cholesterol `(HI_CHOL==1)` in
#' the population:

svytotal(~HI_CHOL, design=design_pop, na.rm=TRUE)

svytotal(~HI_CHOL, design=design_smpl, na.rm=TRUE)

#' Obviously, we need the "population size" weights for an unbiased estimate of
#' the population total, otherwise we just get a sample total.

#' Using the "population size" weights, we can reconstruct the sizes of the
#' population strata:

nhanes <- within(nhanes,{
    strata_size <- ave(WTMEC2YR,SDMVSTRA,FUN=sum)
})
design_pop <- svydesign(id = ~SDMVPSU, strata = ~SDMVSTRA,
                        weights = ~WTMEC2YR, data = nhanes,
                        nest = TRUE, fpc = ~ strata_size)
design_pop

#' Of course, usually its the other way round: starting with the strata and the
#' cluster IDs, the sampling probabilities and sampling weights are computed.
