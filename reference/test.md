# Run all tests for a given package

This function runs all predefined tests for a given package.

## Usage

``` r
test(
  pkg,
  download = TRUE,
  cleanup = FALSE,
  dir = getwd(),
  repo = sctotests(),
  testthat_colours = TRUE
)

# S3 method for class 'validate_result'
print(x, ...)
```

## Arguments

- pkg:

  package name as a string

- download:

  whether to download a fresh set of tests

- cleanup:

  whether to delete testing folder

- dir:

  directory to download tests to. This should have `pkg` at the end. If
  not present, it will be created.

- repo:

  storing the tests

- testthat_colours:

  include coloured testthat output (the colours are implemented as
  particular characters in the output, which make it harder to read in
  some circumstances)

- x:

  a validate_result object (the output from \`test\`)

- ...:

  additional arguments (not used)

## Value

Object of class `validate_result`

## Details

The print method supports the creation of a new issue in the package's
repository by presenting the information in a format that can be copied
and pasted in the issue template.

## Examples

``` r
if(FALSE) test("stats")
```
