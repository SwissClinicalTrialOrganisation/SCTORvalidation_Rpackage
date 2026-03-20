# Get the list of packages that have tests in a repository

Tests are assumed to be in a \`tests\` directory in the repository.

## Usage

``` r
get_tested_pkgs(repo = sctotests())
```

## Arguments

- repo:

  repository to check for tests

## Value

character vector of package (directory) names

## Examples

``` r
get_tested_pkgs()
#> [1] "accrualPlot" "stats"       "survRM2"    
```
