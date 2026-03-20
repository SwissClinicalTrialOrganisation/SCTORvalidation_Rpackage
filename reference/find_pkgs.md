# Determine which package a function is from

This function takes a character vector of function names and returns a
dataframe containing the package containing those functions.

## Usage

``` r
find_pkgs(funs)
```

## Arguments

- funs:

  a character vector of function names

## Value

dataframe with the function (fun) and it's parent package (package),
each as strings

## Details

Objects that appear to be in the global environment will be indicated as
\`.GlobalEnv\`. Functions that are referenced via a namespace (i.e.
\`::\` or \`:::\`) may not indicate a package, particularly when the
package is not loaded.

Where the same function is found in multiple packages, all packages are
returned. This is particularly the case where functions are re-exported
by multiple packages (e.g. \`dplyr::mutate\` is also exported by
\`gtsummary\`).

Where the \`conflicted\` package is used, the package that takes
priority is returned.

## Examples

``` r
find_pkgs("mutate")
#>      fun package
#> 1 mutate        
```
