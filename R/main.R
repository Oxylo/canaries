source("R/utils.R")

# load data
# csv2rds("binance_hourly_history.csv")
data <- readRDS("data/binance_hourly_history.rds")


# select market btc/usd
# selection <- (data$base == "BTC") & (data$quote == "USDT")
# btc <- data[selection,]
# plot(btc$close, type="l", col="green")
