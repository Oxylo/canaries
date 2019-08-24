test_that("Test 1 rmnoise()", {
  expect_equal(rmnoise(-3:3, threshold=2), c(-3, -2,  0, 0, 0, 2, 3))
})

test_that("Test 2 rmnoise()", {
  expect_equal(rmnoise(-3:3, threshold=c(-1, 2)), c(-3, -2, -1, 0, 0, 2, 3))
})

test_that("Test 3 rmnoise()", {
  expect_equal(rmnoise(-3:3, threshold=c(-1, 2), sign=TRUE), c(-1, -1, -1, 0, 0, 1, 1))
})
