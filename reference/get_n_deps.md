# Get the number of dependencies for a package

Get the number of dependencies for a package

## Usage

``` r
get_n_deps(package, fields = c("Depends", "Imports"), ...)
```

## Arguments

- package:

  package name

- fields:

  list of fields to check for dependencies. Defaults to
  `c("Depends", "Imports")`

- ...:

  additional arguments passed to `packageDescription`.

## Value

integer: the number of dependencies

## Details

The `recursive` and `reverse` arguments are perhaps of most interest.
`recursive` details the number of dependencies of the package, including
those that are dependencies of dependencies. `reverse` details the
number of packages that depend on the package, which may be an indicator
of a high quality package. This function uses the function from the
tools package.

## See also

[`packageDescription`](https://rdrr.io/r/utils/packageDescription.html)

For CRAN packages,
[`package_dependencies`](https://rdrr.io/r/tools/package_dependencies.html)
may be of interest.

## Examples

``` r
if (FALSE) { # \dontrun{
get_n_deps("nlme")
get_n_deps("validation")
get_n_deps("dplyr", reverse = TRUE)
} # }
```
