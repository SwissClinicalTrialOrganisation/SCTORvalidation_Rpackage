# Append new issue data to existing tables

Where an issue is already in the table, the new data will replace the
old data.

Where a package version is already in the table, the new data will
replace the old data.

## Usage

``` r
update_pkg_table(...)

update_tests_table(...)
```

## Arguments

- ...:

  options passed to gen_pkg_table e.g. a list of issues from get_pkgs

## Functions

- `update_tests_table()`: Append new test data to existing tests table

## Examples

``` r
# update_pkg_table()
```
