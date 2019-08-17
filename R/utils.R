#' csv2rds
#'
#' Converts CSV file to RDS format
#'
#' @param fcsv A string
#'
#' @return NULL
#' @export
csv2rds <- function(fcsv){
  if(!grepl("csv", fcsv)){
    print('infile name should have extention csv')
    stop()
  }
  infile <- file.path("data", fcsv)
  msg <- paste("Loading", fcsv, "...")
  print(msg)
  csv <- read.csv(infile)
  outf <- sub("csv", "rds", fcsv)
  outfile <- file.path("data", outf)
  msg <- paste("Exporting CSV to", outf, "...")
  print(msg)
  saveRDS(csv, file=outfile)
  msg <- paste("Ready. RDS file saved in data folder")
  print(msg)
  return(NULL)
}


#' vlookup
#'
#' Lookup function similar to Excel but with two extra features: lookup column
#' can be any column (not just the 1st column) and includes interpolation
#' lookup
#'
#'
#' @param lookup_value a length-one vector, value you want to lookup
#' @param table dataframe specifying the lookup table
#' @param lookup_colname a string, column name containing lookup_value
#' @param return_colname a string, column name containing return value
#' @param range_lookup a string indicating lookup method,
#' either "floor", "interpolate" or "ceiling"
#' @return a length-one vector, specifying the value found in column labeled
#' with given lookup_colname
#' @export
#'
#' @examples
#'
#'
vlookup <- function(){

}

#' Copymay
#'
#' Checks mayority of ones in first d vector elements
#'
#' @param x vector containing zeros and ones only
#' @param d integer indicating how many elements should be taken into account
#'
#' @return Boolean. TRUE if most d elements are 1, else FALSE
#' @export
#'
#' @examples
#' copymay(c(1, 0, 1), 2)  # FALSE
#' copymay(c(1, 0, 1), 3)  # TRUE
#' copymay(c(1, 0, 1, 0), 4)  # FALSE
copymay <- function(x, d){
  items <- x[1:d]
  return(mean(items) > 0.5)
}

