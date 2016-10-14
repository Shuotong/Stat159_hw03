# Computes Residual Sum of Squares (RSS), the sum of the squares of residuals.
# It is a measure of the discrepancy between the data and an estimation model.
# Expected Input: a regression object
# Expected Output: value of Residual Sum of Squares
residual_sum_squares <- function (reg_obj) {
  sum(reg_obj.fit$residuals^2)
}


# Computes Total Sum of Squares (TSS), the sum over all observations, of the squared differences of each observation from the overall mean.
# Expected Input: a regression object
# Expected Output: value of Total Sum of Squares
total_sum_squares <- function (reg_obj) {
  origina_data = reg_obj$residuals+reg_obj$fitted.values
  sum((origina_data-mean(origina_data))^2)
}

# Description: Computes R-squared: the proportion of the variance in the dependent variable that is predictable from the independent variable
# Expected Input: a regression object
# Expected Output: values of R-squared
r_squared <- function(reg_obj) {
  rss <- residual_sum_squares(reg_obj)
  tss <- total_sum_squares(reg_obj)
  1 - rss/tss
}

# Description: Computes F-statistic: a value indicates the fitness of regression of coefficients
# Expected Input: a regression object
# Expected Output: value of F-statistic
f_statistic <- function(reg_obj) {
  num_of_predictor <- length(reg_obj$coefficients) - 1
  n <- length(reg_obj$fitted.values)
  rss <- residual_sum_squares(reg_obj)
  tss <- total_sum_squares(reg_obj)
  ((tss-rss)/num_of_predictor)/(rss/(n-num_of_predictor-1))
}

# Description: Computes Residual Standard Error: the standard error of the residual
# Expected Input: a regression object
# Expected Output: value of Residual Standard Error
residual_std_error <- function(regression_object) {
  num_of_predictor <- length(reg_obj$coefficients) - 1
  n <- length(reg_obj$fitted.values)
  rss <- residual_sum_squares(reg_obj)
  sqrt(rss/(n-num_of_predictor-1))
}
