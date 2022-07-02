
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![R-CMD-check](https://github.com/rstudio/rticles/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/rstudio/rticles/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/rstudio/rticles/branch/main/graph/badge.svg)](https://app.codecov.io/gh/rstudio/rticles?branch=main)

<!-- badges: end -->

# CUPrticles

The **CUPrticles** package provides a suite of custom [R
Markdown](https://rmarkdown.rstudio.com) LaTeX formats and templates for
Cambridge University Press journal articles. This is a fork of the
[rticles](https://github.com/rstudio/rticles/) package, and keeps much
of its codebase.

## Installation

You can install and use **CUPrticles** as follows:

``` r
remotes::install_github("CoffeeCryptid/CUPrticles")
```

## Using CUPrticles

To use **CUPrticles** from RStudio, you can access the templates through
`File -> New File -> R Markdown`. This will open the dialog box where
you can select from one of the available templates:

![New R
Markdown](https://bookdown.org/yihui/rmarkdown/images/rticles-templates.png)

If you are not using RStudio, you’ll also need to install
[Pandoc](https://pandoc.org) following these
[instructions](https://bookdown.org/yihui/rmarkdown-cookbook/install-pandoc.html).
Then, use the `rmarkdown::draft()` function to create articles:

``` r
rmarkdown::draft(
    "MyPSRMArticle.Rmd", template = "cup", package = "CUPrticles"
)
rmarkdown::draft(
    "MyPASAArticle", template = "pasa", package = "CUPrticles"
)
```

This will create a folder containing a Rmd file using the corresponding
output format and all the assets required by this format.

## Templates

This package currently contains two templates:

## Cambridge University Press template

This template can generate articles for the following journals:

-   Annals of Glaciology (aog)
-   Journal of Glaciology (jog)
-   British Journal of Political Science (bjps)
-   Political Science and Research Methods (psrm)
-   Journal of Public Policy (jpup)

The abbreviation of the journal name has to be specified in the YAML
header.

## Publications of the Astronomical Society of Australia (PASA) template

This is separate from the other template as it needs additional
resources, a slightly different Pandoc template and a different citation
package (natbib).

------------------------------------------------------------------------

Under the hood, LaTeX templates are used to ensure that documents
conform precisely to submission standards. At the same time, composition
and formatting can be done using lightweight
[markdown](https://rmarkdown.rstudio.com/authoring_basics.html) syntax,
and R code and its output can be seamlessly included using
[knitr](https://yihui.org/knitr/).
