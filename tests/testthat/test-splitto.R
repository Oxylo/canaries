test_that("Test 1 splitto()", {
  expect_equal(splitto(10, 3), list("1"=1:3, "2"=4:6, "3"=7:9, "4"=10))
})

test_that("Test 2 splitto()", {
  expect_equal(splitto(100, 24), list("1"=1:24, "2"=25:48, "3"=49:72, "4"=73:96, "5"=97:100))
})

test_that("Test 3 splitto()", {
  expect_equal(splitto(10, 20), list("1"=1:10))
})
