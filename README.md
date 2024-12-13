
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SCTORvalidation

<!-- badges: start -->
<!-- badges: end -->

The goal of SCTORvalidation is to provide an easy approach for the
documentation and implementation of package and function tests for the
SCTO R validation project. Package validations themselves can be found
in the [validation_platform
repository](https://github.com/SwissClinicalTrialOrganisation/validation_platform).

## Installation

You can install the development version of validation from
[GitHub](https://github.com/SwissClinicalTrialOrganisation/SCTORvalidation_Rpackage)
with:

``` r
# install.packages("devtools")
devtools::install_github("SwissClinicalTrialOrganisation/SCTORvalidation_Rpackage")
```

or

``` r
install.packages('SCTORvalidation', repos = c('https://ctu-bern.r-universe.dev', 'https://cloud.r-project.org'))
```

## Testing

The package contains a `test` function which is used to run all tests
for a named package.

``` r
library(SCTORvalidation)
## basic example code

# test("presize")
```

<!-- The output of this function is a string which can be copied and pasted into an appropriate issue on the GitHub `pkg_validation` repository. -->

### Implementing new tests

All tests are stored in the [`validation_tests`
repository](https://github.com/SwissClinicalTrialOrganisation/validation_tests)
in package specific folders. E.g. the `tests/presize` folder contains
tests relevant to the `presize` package.

(At least) three files are required. The test_skeleton function can be
used to create these files.

1.  setup-`package`.R
2.  info.txt
3.  test-`function`.R

The `setup-package.R` file installs, updates and/or loads the package
being tested and any other relevant steps (e.g. loading a dataset).

`info.txt` contains a plain text description of the tests.

test-`function`.R contains the tests themselves. Tests should be written
using `testthat` syntax, e.g.

    test_that("'1:3' creates a sequence of 1, 2, 3", 
              expect_equal(1:3, c(1,2,3)))

### Checking your session

``` r
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(lubridate)
#> 
#> Attaching package: 'lubridate'
#> The following objects are masked from 'package:base':
#> 
#>     date, intersect, setdiff, union

SCTORvalidation::check_session()
#> 
#> ── Summary of packages in the session:  ────────────────────────────────────────
#> Only explicitly loaded packages are included.
#> 
#> 
#> ── Package risk assessments:  ──
#> 
#> 
#> 
#> ── Of 2 loaded packages,  
#> 
#> ✔ 1 has been risk assessed, 
#> 
#> ! 0 are a different version of a risk assessed package, 
#> 
#> ✖ 1 has not been risk assessed to date. 
#> 
#> The following packages require risk assessment:
#> • lubridate
#> 
#> 
#> ── Packages with tests:  ──
#> 
#> 
#> 
#> ── Of 2 loaded packages,  
#> 
#> ✔ 0 have tests on this R version and OS. 
#> 
#> 
#> 
#> ── There are 0 high risk package(s) ──
#> 
#> 
#> 
#> ── There are 0 medium risk package(s) ──
#> 
#> 
#> 
#> See <https://swissclinicaltrialorganisation.github.io/validation_platform/> for
#> further details on package validation within the SCTO framework
```
