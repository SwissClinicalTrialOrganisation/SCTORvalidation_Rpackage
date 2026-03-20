# Convert issues from to tables

These functions are intended for use by a github action to generate a
table for the website

This is intended for use by a github action to generate a table for the
website

## Usage

``` r
gen_pkg_table(pkgs = NULL, ...)

gen_tests_table(tests = NULL, ...)
```

## Arguments

- pkgs:

  NULL or a list of issues from `get_issues`

- ...:

  options passed to `get_issues`

- tests:

  NULL or a list of issues from `get_issues`

## Functions

- `gen_tests_table()`: Generate a table of function tests
