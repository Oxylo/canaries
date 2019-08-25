source("R/utils.R")

# settings
outfile     <- "~/Desktop/wfscenarios.txt"
thresholds  <- c(0, 0.25, 0.50, 1, 2)
rollwindows <- c(3, 4, 8, 24, 48, 200)
signed      <- c(FALSE, TRUE)
grplen      <- 1000 # we split btc time series is 15 time series 1000 each (+ remainder grp)


# load data
# csv2rds("binance_hourly_history.csv")
data <- readRDS("data/binance_hourly_history.rds")

# select market btc/usd
selection <- (data$base == "BTC") & (data$quote == "USDT")
btc <- data[selection, "close"]
totlen <- length(btc)
print(paste("Total length of BTC time series:", totlen, "hours"))
splitgrps   <- splitto(totlen, grplen)

testgrid <- expand.grid(thresholds,
                        rollwindows,
                        signed)
names(testgrid) <- c("threshold", "lookback", "signed")


if (file.exists(outfile))
  file.remove(outfile)

header <- paste("threshold", "lookback", "signed", "start", "end", "corr", "corr.t", sep=",")
write(header, outfile)

# we look at pct changes per hour
dbtc <- pctchange(btc)


for(i in 1:nrow(testgrid)){
  for(grp in splitgrps){
    row <- testgrid[i,]
    line <- paste(row$threshold, row$lookback, row$signed, grp[1], grp[length(grp)], sep=",")
    print(paste("Processing: ", line, sep=""))
    subseries <- dbtc[grp]
    y <- rmnoise(subseries, threshold = row$threshold, sign = row$signed)
    pred <- wf(y, window=row$lookback, fcf=fc_ann)
    corr <- cor(y, pred, use = "complete.obs")
    pred.t <- rmnoise(pred, threshold = row$threshold, sign = row$signed)
    corr.t <- cor(y, pred.t, use = "complete.obs")
    print(c(round(corr,2), round(corr.t,2)))
    write(paste(line, round(corr,2), round(corr.t,2), sep=","), outfile, append = TRUE)
  }
}
