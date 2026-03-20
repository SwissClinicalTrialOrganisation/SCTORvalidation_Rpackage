# Get the release date of a CRAN package

CRAN packages have a release date associated with them. This function
downloads that date and returns it as a date object.

## Usage

``` r
get_release_date(pkg)
```

## Arguments

- pkg:

  a package name

## Value

character string containing either the date or a message to check
elsewhere

## Details

If the package does not exist on CRAN, the function asks the user to
search elsewhere for the information.

## Examples

``` r
get_release_date("dplyr")
#> [1] "2026-02-03"
```
