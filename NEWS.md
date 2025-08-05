# SCTORvalidation 0.4.4

Bug fix:

* get_n_deps throwed an error when a package had 0 dependencies in "Depends" or "Imports"

# SCTORvalidation 0.4.3

`extract_elements_test` uses laxy regex to extract OS. It previously used greedy regex which caused issues when a package also loaded the Matrix package

# SCTORvalidation 0.4.2

remove desc(version) column from `update_pkg_table`

# SCTORvalidation 0.4.1

* update links to the (renamed) GitHub repositories

# SCTORvalidation 0.4.0

* package name changed from validation to SCTORvalidation (repository name changed to SCTORvalidation_Rpackage)
* addition of functions to extract packages and functions from scripts (`extract_functions_from_dir` and `find_pkgs`)
* modified `check_session` (possible breaking changes to downstream processes)

# validation 0.3.7

Bug fix: 

* get_n_deps passed the fields argument to the wrong argument in packageDescription, resulting in a error.
* test for base packages was not working correctly, as the location of the package was not determined correctly.

# validation 0.3.6

* improved support for datasets stored in the validation_tests repository via `get_test_data`

# validation 0.3.5

* where installation location is unknown, the package source as reported by sessioninfo will be returned (primarily to assist in debugging).
* export additional functions for working with issues and comments
* additional method of collecting the user (gh package insufficient)

# validation 0.3.4

* Addition of tooling to run the validation tests in a CI environment (GHA).
  - `post_issue` function to post issues to the repository.
  - `test_to_text` function to convert the test results to text strings.
* Addition of the news file to keep track of changes. 
