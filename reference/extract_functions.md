# Extract functions from R scripts within a directory

As any functions from high risk packages require testing for use in high
risk products, it is important to know which functions are used in the
code.

## Usage

``` r
extract_functions_from_dir(dir, pattern = ".(r|rnw|rmd|qmd)$", ...)

extract_functions_from_file(file)
```

## Arguments

- dir:

  one or more directory to search for R scripts

- pattern:

  pattern to match files (defaults to variations of R, Rmd, Rnw, and qmd
  files, ignoring case)

- ...:

  additional arguments to \`list.files\`

- file:

  file to extract functions from

## Value

a dataframe with the function (fun) and it's parent package (package),
and accessed_via indicating whether the function was accessed directly
from the namespace with \`::\` or \`:::\`, otherwise it is empty.

## Details

\`extract_functions_from_file\` extracts functions from a single file.
Where the file is a markdown (Rmd or qmd) or Sweave file (Rnw), the R
code is first extracted via the \`knitr::purl\` function.

\`extract_functions_from_dir\` extracts all functions from R scripts
within a directory that match a specified pattern. Specific files can be
chosen via the \`pattern\` argument, which accepts regular expressions.
Files that match \`pattern\` will be parsed for functions.

## Functions

- `extract_functions_from_file()`: Extract functions from a file

## Note

It is important to note that functions used inside e.g. \`lapply\` or
\`sapply\` are not considered functions by the code parser and may not
be extracted unless they are also used directly elsewhere in the code
(e.g. length will not be found if used within \`lapply(..., length)\`,
but would be found if there was an additional use of the length function
elsewhere - \`length(x)\`).

## See also

\[getParseData()\], \[find_pkgs()\]

## Examples

``` r
# extract_functions_from_dir("dirname")
# extract_functions_from_file("file.R")
```
