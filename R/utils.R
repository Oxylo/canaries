#' csv2rds
#'
#' Converts CSV file to RDS format
#'
#' @param fcsv A string
#'
#' @return NULL
#' @export
#'
#' @example
#' csv2rds(data/dataset.csv)
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

csv2rds("binance_hourly_history.csv")
