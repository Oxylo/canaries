source("R/utils.R")

# load data
# csv2rds("binance_hourly_history.csv")
infile <- file.path("data", "binance_hourly_history.rds")
data <- readRDS(infile)


# select market btc/usd
# selection <- (data$base == "BTC") & (data$quote == "USDT")
# btc <- data[selection,]
# plot(btc$close, type="l", col="green")
