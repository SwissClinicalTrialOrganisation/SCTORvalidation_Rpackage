# Convert test evidence table back to a data frame

In order to print nicely in GitHub, tables are formatted using markdown
syntax.

## Usage

``` r
parse_evidence_tab(tab)
```

## Arguments

- tab:

  a string containing the markdown table

## Value

a data frame

## Details

This function can read that syntax and convert it back to a normal data
frame.

## Examples

``` r
tab <- c("|file      |context |test      | nb| passed|skipped |error | warning|",
         "|:---------|:-------|:---------|--:|------:|:-------|:-----|-------:|",
         "|test-lm.R |lm      |message 1 |  8|      4|FALSE   |FALSE |       4|",
         "|test-lm.R |lm      |message 2 |  3|      3|FALSE   |FALSE |       0|")
parse_evidence_tab(tab)
#>        file context      test nb passed skipped error warning
#> 1 test-lm.R      lm message 1  8      4   FALSE FALSE       4
#> 2 test-lm.R      lm message 2  3      3   FALSE FALSE       0
```
