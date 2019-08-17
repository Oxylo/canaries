context("test-experiment")

test_that("copymay(x, d=2)", {
  expect_equal(copymay(c(1, 0, 1), 2), FALSE)
})

test_that("copymay(x, d=3)", {
  expect_equal(copymay(c(1, 0, 1), 3), TRUE)
})
