#' # Merging data frames: An example with data from the British Election Study

#' Here we merge data from the British Election Study. Here we use data from the British Election Study 2010. The data set [bes2010feelings-prepost-for-merge.RData](https://github.com/melff/dataman-r/raw/main/03-data-frames/bes2010feelings-prepost-for-merge.RData) is prepared from the original available at https://www.britishelectionstudy.com/data-object/2010-bes-cross-section/ by removing identifying information and scrambling the data.

load("bes2010feelings-prepost-for-merge.RData")

#' A peek into a data frame about respondents' feelings about
#' parties:

head(bes2010flngs_parties_pre)

#' And anotehr peek into a data frame about respondents' feelings about
#' party leaders:

head(bes2010flngs_leaders_pre)

#' The variable that identifies individual respondents in both
#' data frames is 'id', so we use this variable to match the
#' rows in both data frames:

bes2010flngs_pre_merged <- merge(
    bes2010flngs_parties_pre,
    bes2010flngs_leaders_pre,
    by="id"
)

#' `merge()` also allows for identifier variables that may have
#' different names in the two data frame. In such cases
#' one can use the named arguments `by.x=` and `by.y=`:

bes2010flngs_pre_merged <- merge(
    bes2010flngs_parties_pre,
    bes2010flngs_leaders_pre,
    by.x="id",
    by.y="id"
)

#' It is not absolutely necessary to provide a `by=` argument, if
#' the merged data frames share a variable (with the same name in both)
#' that idenfies cases or observations. Therefore, we can call `merge()` here without any `by=`, `by.x=`, or `by.y=` arguments:

bes2010flngs_pre_merged <- merge(
    bes2010flngs_parties_pre,
    bes2010flngs_leaders_pre
)
head(bes2010flngs_pre_merged)

#' The data frame `constwin` contains data about relectoral districts, that is
#' which party won the respective district seat in 2005 and 2010. The
#' variable that identifies the electoral district is both in the individual-level
#' data frame and the district-level data frame is named `refno`, so we use this
#' as a matching variable.

bes2010pre_merged <- merge(
    bes2010flngs_pre_merged,
    constwin,
    by = "refno" # Not necessary in the present case, because
)                # it is the same in both data frames.

#' As can be glimpsed from the output of `str`, the result of `merge` is
#' sorted by the matching variable, i.e. "refno"

head(bes2010pre_merged)
