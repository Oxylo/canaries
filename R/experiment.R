## understanding the *apply family

## apply()

m <- matrix(c(1,0,1,1,0,
              1,1,1,1,0,
              1,0,0,1,1,
              0,1,1,1,0), nrow = 4)


#' Copymay
#'
#' Checks mayority of ones in first d vector elements
#'
#' @param x vector containing zeros and ones only
#' @param d integer indicating how many elements should be taken into account
#'
#' @return Boolean. TRUE if most d elements are 1, else FALSE
#' @export
#'
#' @examples
#' copymay(c(1, 0, 1), 2)  # FALSE
#' copymay(c(1, 0, 1), 3)  # TRUE
#' copymay(c(1, 0, 1, 0), 4)  # FALSE
copymay <- function(x, d){
  items <- x[1:d]
  return(mean(items) > 0.5)
}
