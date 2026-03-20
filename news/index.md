# Changelog

## SCTORvalidation 0.4.5

Two new parameters were added to the check_session() function to allow
to ignore the check of specified packages.

## SCTORvalidation 0.4.4

Bug fix:

- get_n_deps threw an error when a package had 0 dependencies in
  “Depends” or “Imports”

## SCTORvalidation 0.4.3

`extract_elements_test` uses lazy regex to extract OS. It previously
used greedy regex which caused issues when a package also loaded the
Matrix package

## SCTORvalidation 0.4.2

remove desc(version) column from `update_pkg_table`

## SCTORvalidation 0.4.1

- update links to the (renamed) GitHub repositories

## SCTORvalidation 0.4.0

- package name changed from validation to SCTORvalidation (repository
  name changed to SCTORvalidation_Rpackage)
- addition of functions to extract packages and functions from scripts
  (`extract_functions_from_dir` and `find_pkgs`)
- modified `check_session` (possible breaking changes to downstream
  processes)
