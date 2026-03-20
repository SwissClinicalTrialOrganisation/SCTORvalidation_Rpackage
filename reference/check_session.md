# Check a sessions loaded packages against the risk assessed packages list from GitHub

This function downloads the lists of risk assessed and tested packages
from GitHub and compares them to the packages loaded in the current R
session.

## Usage

``` r
check_session(
  product_risk = c("low", "medium", "high"),
  attached_only = TRUE,
  approved_only = TRUE,
  recommended = FALSE,
  ignore = NA
)

# S3 method for class 'sctovalidity'
print(x, ...)
```

## Arguments

- product_risk:

  character vector, which product risk levels should be included in the
  report (default: c("low", "medium", "high"))

- attached_only:

  logical, should all loaded packages be shown (FALSE; default), or only
  those that are attached (TRUE)

- approved_only:

  logical, should only validated (approved) packages be shown (TRUE;
  default), or also those awaiting approval (FALSE)

- recommended:

  logical, should recommended packages be checked (FALSE; default)

- ignore:

  character vector, packages to ignore during checking (NA; default)

- x:

  output from `check_session`

- ...:

  options passed to methods

## Examples

``` r
if (FALSE) { # \dontrun{
check_session()
} # }
```
