if (!xfun::pkg_available("testthat", "3.0.0")) return()

library(testthat)
library(CUPrticles)

test_check("CUPrticles")
