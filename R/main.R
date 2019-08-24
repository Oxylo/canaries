source("R/utils.R")

# load data
# csv2rds("binance_hourly_history.csv")
infile <- file.path("data", "binance_hourly_history.rds")
data <- readRDS(infile)


# select market btc/usd
# selection <- (data$base == "BTC") & (data$quote == "USDT")
# btc <- data[selection,]
# plot(btc$close, type="l", col="green")

#' # ########### TEMP CODE ##################
#'
#' library(forecast)
#' data <- read.csv("data/eneco.data")
#' myts <- ts(data$gas, start=c(2007, 11), end=c(2019, 6), frequency=12)
#' autoplot(myts, main='gas consumption', xlab="year", ylab="m3")
#'
#' fcf <- function(y, h)
#'   #' User defined forecast function
#'   #'
#'   #' @param y : time series
#'   #' @param h : prediction horizon
#' {
#'   fit <- nnetar(y, repeats=20, p=1, P=1, size=2, lambda=0)
#'   fc <- forecast(fit, h)
#' }
#'
#' err <- tsCV(myts, fcf, h=1)
#' fitted <- myts - lag(err, -1)
#' y.fitted <- cbind(myts, fitted)
#' par(mfcol=c(2,1))
#'
#' plot1 <- (autoplot(y.fitted, xlab='year', ylab='y and predicted')
#'           + theme(legend.position = 'bottemright')
#'           + scale_x_continuous(breaks = seq(2008, 2020, 2))
#'           + scale_color_manual(values=c('black', 'orange'))
#' )
#' plot2 <- autoplot(lag(err, -1), xlab='year', ylab='y minus predicted', color='red')
#' grid.arrange(plot1, plot2, nrow=2)
#'
#' wf <- function(y)
#'   #' Generate 1 period ahead predictions
#'   #'
#'   #' @param y : time series
#' {
#'   err <- tsCV(myts, fcf, h=1)
#'   wf.predict <- myts - lag(err, -1)
#' }



##########################################


pctchange <- function(ts) {
  lagged <- lag(ts, -1)
  pctch <- 100 * (ts/lagged - 1)
  pctch <- ts(c(NA, pctch))
  return(pctch)}





