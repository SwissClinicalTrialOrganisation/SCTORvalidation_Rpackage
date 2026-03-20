# Download datasets from the SCTO validation tests repository

Tests sometimes require specific datasets. Where a built-in dataset is
insufficient, a dataset that exists within the SCTO validation tests
repository can be downloaded.

## Usage

``` r
get_test_data(dataset, repo = sctotests(), dir = getwd())
```

## Arguments

- dataset:

  The filename of the dataset to download

- repo:

  the repository to download from

- dir:

  the directory to save the dataset to (purely for testing purposes -
  this option should not be used in everyday use)

## Value

TRUE if the dataset is downloaded successfully

## Details

This function can be used in the setup-pkg.R file so that the datasets
are available to the tests.

The function will download the dataset from the SCTO validation tests
repository to the working directory, which testthat sets to the
directory containing the test files. Therefore, the dataset can be
downloaded and saved and used without referring to any other directory.
The setup-pkg.R file might then contain:

    ...
    library(testthat)

    get_test_data("mtcars.csv")
    dat <- read.csv("mtcars.csv")

    withr::defer({})

## Examples

``` r
# download the file to a temporary directory
tempdir <- tempdir()
get_test_data("mtcars.csv", dir = tempdir)
dat <- read.csv(file.path(tempdir, "mtcars.csv"))
unlink(tempdir)

if (FALSE) { # \dontrun{
# within the setup-pkg.R file
get_test_data("mtcars.csv")
# then load the data using an appropriate function
dat <- read.csv("mtcars.csv")
} # }
```
