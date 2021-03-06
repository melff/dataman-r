#' # POSIXct time objects

as.POSIXct(7200,origin="1970-01-01")

t0 <- as.POSIXct(7200,origin="1970-01-01",tz="GMT")
t0 <- as.POSIXct(7200,origin="1970-01-01")
attr(t0,"tzone") <- "GMT"   

as.POSIXct(c("97/11/12 12:45","98/01/23 14:20"),
           format="%y/%m/%d %H:%M",tz="GMT")
