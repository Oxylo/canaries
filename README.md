canaries
========

The object of this project is getting a better understanding of price movements in crypto markets: can you make (some) money using autoregressive neural networks?

## Installation (local)

    $ git clone https://github.com/Oxylo/codex.git your_project_name

Usage
=====

Copy data to data/raw and run scripts in appropriate order 

    > source("01_preprocess.R")
    > source("02_train.R")
    > source("03_predict.R")
    

Tests
=====

If you’re using RStudio, press Cmd/Ctrl + Shift + T (or run devtools::test() if not) to run all the tests in a package


How it works
============ 

Basically, the trained model performs two steps:
1. for each crypto market, predict the next hour price, using an autoregressive neural network
2. improve predictive power for each market by combining these predictions
 

