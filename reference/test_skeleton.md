# Add a new package skeleton

This function will create the directory if it does not exist, and add a
\`info.txt\` file with the package name, and a \`setup-pkg.R\` file with
the necessary setup code.

## Usage

``` r
test_skeleton(pkg, funs, dir = getwd())
```

## Arguments

- pkg:

  package to be tested

- funs:

  functions to be tested

- dir:

  where to save the tests/skeleton

## Value

a set of files in your working directory, which can be edited and
uploaded to github

## Examples

``` r
# test_skeleton(pkg = "dplyr", funs = c("select", "filter"))
```
