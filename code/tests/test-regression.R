library(testthat)
# load the source code of the functions to be tested
source("../functions/regression-functions.R")

# multiple regression
reg <- lm(mpg ~ disp + hp, data = mtcars)

# summary of 'reg'
regsum <- summary(reg)

# Test for Residual Sum Squares
context("Test for RSS")
test_that("residual_sum_square should work as expected", {
  expect_equal(length(residual_sum_squares(reg)), 1)
  expect_equal(residual_sum_squares(reg), sum(reg$residuals^2))
})

# Test Total Sum of Squares
context("Test for TSS")
test_that("total_sum_squares works as expected", {
  expect_equal(length(total_sum_squares(reg)), 1)
  expect_equal(total_sum_squares(reg),
               sum((mtcars$mpg-mean(mtcars$mpg))^2))
})

# Test Residual Standard Error
context("Test for Residual Standard Error")
test_that("residual_std_error should work as expected",{
  expect_equal(residual_std_error(reg), regsum$sigma)
})

#  Test R-squared
context("Test for R-squared")
test_that("r_squared should work as expected",{
  expect_equal(r_squared(reg), regsum$r.squared)
})

# Test F-statistic
context("Test for F-statistic")
test_that("f_statistic should work as expected",{
  expect_equal(f_statistic(reg), regsum$fstatistic[1][['value']])
})


