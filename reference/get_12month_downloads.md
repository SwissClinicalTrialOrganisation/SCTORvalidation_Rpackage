# Get number of downloads in the last 12 months

Note: this is only available for CRAN or bioconductor packages

## Usage

``` r
get_12month_downloads(package, from = Sys.Date() - 365, to = Sys.Date())
```

## Arguments

- package:

  package name

- from:

  start date

- to:

  end date

## Value

integer number of downloads

## Examples

``` r
get_12month_downloads("ggplot2")
#> [1] 23982593
get_12month_downloads("secuTrialR")
#> [1] 6986
```
