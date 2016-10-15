# Statistics 159 Homework 03

## Introduction

In this homework, our objective is to reproduce the multiple regression analysis introduced in Chapter 3, Linear Regression, from the book "An Introduction to Statistical Learning" by Gareth James, Deniela Witten, Trevor Hastie and Robert Tibshirani.


## Structure

The structure of this project is as following:

```
stat159-fall2016-hw03/
    .gitignore
    README.md
    LICENSE
    Makefile
    session-info.txt
    code/
        README.md
        test-that.R
        functions/
            regression-functions.R
        scripts/
            eda-script.R
            regression-script.R
            session-info-script.R
    data/
    	README.md
    	Advertising.csv
    	eda-output.txt
        correlation-matrix.RData
    	regression.RData
    images/
        histogram-sales.png
        histogram-tv.png
        histogram-radio.png
        histogram-newspaper.png
        scatterplot-matrix.png
        scatterplot-tv-sales.png
        scatterplot-radio-sales.png
        scatterplot-newspaper-sales.png
        residual-plot.png
        scale-location-plot.png
        normal-qq-plot.png
    report/
    	report.Rmd
    	report.pdf
```

## Instructions

Install R packages, `xtable` and `testthat`:

```
install.packages("xtable")
install.packages("testthat")
````

Run `make` to reproduce the report
Run `make clean` to delete the report
Run `make data` to download data

More detailed instructions are given in README.md

## Contributor

[Shuotong Wu](http://github.com/shuotong)

## License

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/)

All code is license under [BSD-2.0](https://opensource.org/licenses/BSD-2-Clause).