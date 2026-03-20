# Interact with the GitHub API to get or set issue information

These functions provide various ways to interact with github issues.

Open/update an issue:

`post_issue` opens a new issue in a repository, with a defined body and
title.

`update_issue` updates an existing issue in a repository (could also be
used instead of `add_labels` or `close_issue`).

Getting issues:

`get_issue` downloads a single issue from a repository.

`get_issues` downloads all issues from a repository.

`get_test_reports` downloads all issues from a repository, filtering
those with test labels, and converts the issue to a dataframe.

Labels:

`add_label` adds a particular label to an issue.

`remove_label` removes a particular label from an issue.

Comments:

`get_comments` downloads all comments from an issue.

`post_comment` posts a comment to an issue.

Closing an issue:

`close_issue` closes an issue.

These functions are primarily for the use in github actions rather than
for the standard user.

See https://docs.github.com/en/rest/issues/issues for full information.

## Usage

``` r
add_label(issue, label, repo = sctoreports())

close_issue(issue, repo = sctoreports())

get_comments(issue, repo = sctoreports())

get_issue(issue, repo = sctoreports())

get_issues(repo = sctoreports())

get_test_reports(repo = sctoreports(), approved_only = FALSE)

post_comment(issue, comment, repo = sctoreports())

post_issue(body, title, repo = sctoreports())

remove_label(issue, label, repo = sctoreports())

update_issue(issue, ..., repo = sctoreports())
```

## Arguments

- issue:

  issue number to update

- label:

  label to remove

- repo:

  repository name

  ... could be e.g. body, title, labels (should be a list), state (open
  or closed) see
  https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#update-an-issue

- approved_only:

  only return approved packages (logical)

- comment:

  the comment to be made

- body:

  issue body

- title:

  issue title

- ...:

  arguments passed to gh

## Value

a list of comments

dataframe

## Examples

``` r
# remove_label(issue = 1, label = "test")

# post_comment(issue = 1, comment = "This is a test comment")
# get_issue(21)
# post_comment(issue = 1, comment = "This is a test comment")
# post_issue("Some body text", title = "Issue title")
# remove_label(issue = 1, label = "test")

# post_issue("Some body text", title = "Issue title")
```
