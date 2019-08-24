test_that("Test pctchange()", {
  expect_equal(pctchange(c(8,4,0,1,3)), c(NA,-50,-100,NA,200))
})
