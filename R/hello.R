# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'
#@ "_PACKAGE"


A <- 2

#' run_test
#'
#' Runs given testfile
#'
#' @param filename String
#'
#' @return Testresult
#' @export
#'
#' @examples
#' run_test(test-square.R)
run_test <- function(filename){
  path <- file.path("tests", "testthat", filename)
  testthat::test_file(path)
}



hello <- function() {
  print("Hello, world!")
}


#' Summe
#'
#' Returns the sum of any number of numeric vectors
#'
#' @param x A numeric vector
#' @param y Another numeric vector
#'
#' @return Length-one numeric vector
#' @export
#'
#' @examples
#' summe(1, 3, 5)       # = 9
#' summe(1:4, c(6, 7))  # = 23
summe <- function(...){
  params <- c(...)
  return(sum(params))
}


#' Wow
#'
#' Prints Wow! Pretty cool uh?!
#'
#' @return string
#' @export
#'
#' @examples
#' print('wow!')
wow <- function(){
  print('Wow!')
}

#' Squareme
#'
#' Returns the square of x
#'
#' @param x Numeric vector
#'
#' @return Numeric vector of same length as x
#' @export
#'
#' @examples
#' squareme(2)    # = 4
#' squareme(1:4)  # = c(1, 4, 9, 16)
squareme <- function(x){
  return(x**2)
}
