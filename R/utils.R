library(forecast)

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
#' rmnoise(-3:3, threshold=c(-1, 2))            # =c(-3, -2, -1, 0, 0, 2, 3)
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

#' Forecast autoregressive neural net
#'
#' User defined forecast function
#'
#' @param x Time series
#' @param h Scalar indicating prediction horizon
#'
#' @return Double
#' @export
#'
#' @examples
fc_ann <- function(x, h){
  # Let algo determine params like so: p=1, P=1, size=2
  fit <- nnetar(x, repeats=20, lambda=NULL)
  fc <- forecast(fit, h)
  return(fc)
}

#' Walk foreward analysis
#'
#' Return 1 period ahead predictions using rolling training window
#'
#' @param x vector or time series
#' @param window integer specifying rolling window
#' @param fcf forecast funcion
#'
#' @return vector or time series
#' @export
#'
#' @examples
wf <- function(x, window, fcf){
  err <- tsCV(x, fcf, window=window, h=1)
  predictions <- x - lag(err, -1)
  return(predictions)
}


#' Split to equal length groups
#'
#' Return start & end index of each group
#'
#' Note: splitto() is similar to split() but splitto() does works fine
#' (no warnings) when grplen is not a multiple of totlen
#'
#' @param totlen Integer specifying total length
#' @param grplen Integer specifying length of each group
#'
#' @return list of vectors
#' @export
#'
#' @examples
#' splitto(10, 3)    # list("1"=1:3, "2"=4:6, "3"=7:9, "4"=10)
#' splitto(100, 24)  # list("1"=1:24, "2"=25:48, "3"=49:72, "4"=73:96, "5"=97:100)
#' splitto(10, 20)   # list("1"=1:10)

splitto <- function(totlen, grplen){
  nfullgrps <- totlen %/% grplen
  remainder <- totlen %% grplen
  if(nfullgrps == 0)
    fac <- rep(1, each=remainder)
  else
    fac <- c(rep(1:nfullgrps, each=grplen), rep(nfullgrps+1, each=remainder))
  return(split(1:totlen, fac))
}






