#' # Appending data frames

#' First we load some example data from the British Election Study 2010. The data set [bes2010feelings-for-append.RData](https://github.com/melff/dataman-r/raw/main/03-data-frames/bes2010feelings-for-append.RData) is prepared from the original available at https://www.britishelectionstudy.com/data-object/2010-bes-cross-section/ by removing identifying information and scrambling the data.

load("bes2010feelings-for-append.RData")

#' We now have two BES data frames, one from the pre-election wave and another
#' from the post-election wave. They contain the same variables, but in a different
#' order:

str(bes2010flngs_pre)

str(bes2010flngs_post)

#' If the variables in the two data frames differ trying to use `rbind()` to append
#' the data frames fails.

bes2010flngs_prepost <- rbind(bes2010flngs_pre[-1],
                              bes2010flngs_post[-1])

#' If the variables in the two data frame are the same but differ in their order,
#' `rbind()` succeeds and the variables are sorted all into the same order before the
#' data frames are combined into a single one:

bes2010flngs_prepost <- rbind(bes2010flngs_pre,
                              bes2010flngs_post)

#' We compare the tail-ends of the data resulting data frame
#' `bes2010flngs_prepost` and the data frame given as second argument to
#' `rbind`. The tail-ends are identical except for the order of the
#' variables.

options(width=200)
tail(bes2010flngs_prepost)

tail(bes2010flngs_post)
