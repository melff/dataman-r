#' # Date arithmetic

# R knows the lengths of months, e.g. that March has 31 days:
d0 <- as.Date("1968-03-01")
d0 + 31

# R also knows that 1968 was a leap year,
d1 <- as.Date("1968-02-28")
d1 + 1

# that 1900 was not a leap year,
d2 <- as.Date("1900-02-28")
d2 + 1

# that 2000 was a leap year,
d3 <- as.Date("2000-02-28")
d3 + 1

# and that leap years are 366 days long
d3 + 366
