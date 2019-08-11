test_that("make sure these numbers a squared correctly", {
  expect_equal(squareme(2), 4)
})

test_that("Should work for vectors too", {
  expect_equal(squareme(1:4), c(1, 4, 9, 16))
})

