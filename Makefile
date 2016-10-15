.PHONY: data tests eda regression report clean all

eda_script = code/scripts/eda-script.R
regression_script = code/scripts/regression-script.R
data = data/Advertising.csv
report = report/report.Rmd

# download the file Advertising.csv
data:
	cd data ; curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv
# run the unit tests of your functions
tests: code/test-that.R code/tests/test-regression.R
	Rscript code/test-that.R

# perform the exploratory data analysis
eda: $(eda_script) $(data)
	Rscript eda-script.R

# perform the series of regression analyses
regression: $(regression_script) $(data)
	Rscript $(regression_script)

# display session info
sessionInfo: code/scripts/session-info-script.R
	Rscript $<
# regression functions
function: code/functions/regression-functions.R
	Rscript $<

#generate report
report:  $(report) regression eda function
	cd report ; Rscript -e "library(rmarkdown); render('report.Rmd','html_document')"

# will delete the generated report
clean:
	cd report ; rm -f report.html