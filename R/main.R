
# load data
csv2rds("binance_hourly_history.csv")

# select market btc/usd
selection <- (data$base == "BTC") & (data$quote == "USDT")
btc <- data[selection,]
plot(btc$close, type="l", col="green")
