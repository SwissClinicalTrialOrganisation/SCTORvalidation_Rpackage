# Derive the location of a package's source code

This function tries to determine where a package was installed from,
e.g. CRAN, GitHub, r-universe, etc. If the package comes from a git
repository, it also attempts to extract the repository URL and commit
hash.

## Usage

``` r
get_pkg_source(pkg, ...)
```

## Arguments

- pkg:

  package to check the source of

- ...:

  parameters passed to other methods

## Details

If the package was installed from a r-universe, the function will return
the git repository URL and commit hash of the package, rather than the
r-universe URL. E.g. this package is installed from the CTU-Bern
r-universe, but the function returns the URL of the GitHub repository
(`https://github.com/SwissClinicalTrialOrganisation/validation`) and the
commit hash.
