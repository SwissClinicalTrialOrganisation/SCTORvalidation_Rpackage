# Package index

## Functions for everyday use

- [`check_session()`](check_session.md)
  [`print(`*`<sctovalidity>`*`)`](check_session.md) : Check a sessions
  loaded packages against the risk assessed packages list from GitHub
- [`load_pkg_table()`](load_pkg_table.md)
  [`load_tests_table()`](load_pkg_table.md) : Load the flat file of
  validated packages from github
- [`risk_hook()`](risk_hook.md) : Hook for collecting user-defined chunk
  risk level in markdown documents
- [`find_pkgs()`](find_pkgs.md) : Determine which package a function is
  from
- [`extract_functions_from_dir()`](extract_functions.md)
  [`extract_functions_from_file()`](extract_functions.md) : Extract
  functions from R scripts within a directory

### Functions to aid in package risk assessment

- [`get_12month_downloads()`](get_12month_downloads.md) : Get number of
  downloads in the last 12 months
- [`get_n_deps()`](get_n_deps.md) : Get the number of dependencies for a
  package
- [`get_release_date()`](get_release_date.md) : Get the release date of
  a CRAN package
- [`get_pkg_source()`](get_pkg_source.md) : Derive the location of a
  package's source code

### Functions to aid in testing packages

- [`test()`](test.md) [`print(`*`<validate_result>`*`)`](test.md) : Run
  all tests for a given package
- [`test_skeleton()`](test_skeleton.md) : Add a new package skeleton
- [`get_tests()`](get_tests.md) : download test files from the
  validation_tests repo
- [`get_test_data()`](get_test_data.md) : Download datasets from the
  SCTO validation tests repository

## Functions primarily for use in GitHub actions

Many functions are only intended to be used in GitHub actions rather
than for normal users.

### Links to GitHub repositories

These are accessory functions containing the names of the repositories

- [`sctoreports()`](repos.md) [`sctotests()`](repos.md)
  [`sctopkg()`](repos.md) : SCTO repositories

### Functions that interface directly with GitHub

- [`gen_pkg_table()`](gen_pkg_table.md)
  [`gen_tests_table()`](gen_pkg_table.md) : Convert issues from to
  tables
- [`add_label()`](get_issue.md) [`close_issue()`](get_issue.md)
  [`get_comments()`](get_issue.md) [`get_issue()`](get_issue.md)
  [`get_issues()`](get_issue.md) [`get_test_reports()`](get_issue.md)
  [`post_comment()`](get_issue.md) [`post_issue()`](get_issue.md)
  [`remove_label()`](get_issue.md) [`update_issue()`](get_issue.md) :
  Interact with the GitHub API to get or set issue information

### Functions to work with issue data

- [`calculate_pkg_score()`](calculate_pkg_score.md) : Convert the text
  risk metric answers to numeric values and calculate a score
- [`get_valid_pkgs()`](get_valid_pkgs.md) : Get the list of validated
  packages from GitHub
- [`is_()`](is_.md) [`is_package()`](is_.md) [`is_test()`](is_.md)
  [`is_approved()`](is_.md) [`is_triage()`](is_.md)
  [`get_labels()`](is_.md) : Check whether an issue has a particular
  label
- [`parse_evidence_tab()`](parse_evidence_tab.md) : Convert test
  evidence table back to a data frame
- [`update_pkg_table()`](update_pkg_table.md)
  [`update_tests_table()`](update_pkg_table.md) : Append new issue data
  to existing tables
- [`validate_pkg_issue()`](validate_pkg_issue.md)
  [`validate_test_issue()`](validate_pkg_issue.md) : Validate the inputs
  for package or function tests

### Functions related to running tests

- [`get_tested_pkgs()`](get_tested_pkgs.md) : Get the list of packages
  that have tests in a repository
- [`test_to_text()`](test_to_text.md) : Convert a test result object to
  a text string for posting to GitHub
