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



#' Pctchange
#'
#' Calculates the percentage change between the current and a prior element.
#'
#' @param x A vector or time series containing at least 2 elements
#'
#' @return vector or time series
#' @export
#'
#' @examples
#' v <- c(8, 4, 0, 1, 3)
#' ts <- ts(v)
#' pctchange()  # c(NA, -50, -100, NA, 200)
pctchange <- function(x){
  lagged <- c(NA, x[-length(x)])
  change <- 100 * (x/lagged - 1)
  cleaned <- ifelse(is.finite(change), change, NA)
}

#' Remove noise
#'
#' Sets value equal to zero if between given threshold bounderies
#'
#' @param x vector
#' @param threshold vector length 1 or 2
#' @param logical Default FALSE. If TRUE, negative and positive values are converted to
#' +1 and -1 respectively
#' @return vector
#' @export
#'
#' @examples
#' rmnoise(-3:3, threshold=2)                   # =c(-3, -2,  0, 0, 0, 2, 3)
#' rmnoise(-3,3, threshold=c(-1, 2))            # =c(-3, -2, -1, 0, 0, 2, 3)
#' rmnoise(-3:3, threshold=c(-1, 2), sign=TRUE) # =c(-1, -1, -1, 0, 0, 1, 1)
rmnoise <- function(x, threshold, sign=FALSE){
  n <- length(threshold)
  if(!(n %in% c(1,2)))
    stop("threshold parameters must be a vector length 1 or 2")

  if(n==1) {
    low <- -1 * abs(threshold)
    upp <- abs(threshold)
  }
  else {
    low <- threshold[1]
    upp <- threshold[2]
  }

  is.noise <- (x > low) & (x < upp)
  denoised <- ifelse(is.noise, 0, x)
  if(sign) denoised <- sign(denoised)
  return(denoised)
}

