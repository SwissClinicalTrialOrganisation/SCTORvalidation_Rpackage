# Check whether an issue has a particular label

These functions provide a way to check whether an issue has a particular
label.

`is_` is the main function. The others are wrappers around this one.

`is_package` checks for a package label.

`is_test` checks for a test label.

`is_approved` checks for an approved label.

`is_triage` checks for a triage label.

`get_labels` gets all labels associated with an issue.

## Usage

``` r
is_(issues, what)

is_package(issues)

is_test(issues)

is_approved(issues)

is_triage(issues)

get_labels(issue)
```

## Arguments

- issues:

  a list of issues

- what:

  the label to check for

- issue:

  a specific issue

## Examples

``` r
# issues <- get_issues()
# is_package(issues)

# issue <- get_issue(21)
# is_package(list(issue))
```
