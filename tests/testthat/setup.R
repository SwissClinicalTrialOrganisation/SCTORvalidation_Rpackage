# score for a made-up assessment issue, questions as in the github form
# defaults = lowest risk, 150000 downloads -> 0.5
pkg_score <- function(author = "Well-known or known credentials",
                      maintainer = "Available",
                      purpose = "Non-statistical",
                      dependencies = "0",
                      on_cran = "Yes",
                      code_documented = "Yes",
                      downloads = "150000",
                      bug_reporting = "Yes",
                      vignettes = "Yes",
                      tests = "Yes, comprehensive"){
  body <- c(
    "### Date of release of the evaluated version of the package", "", "2026-01-01", "",
    "### The package author has...", "", author, "",
    "### Is there a maintainer listed for the package and are their contact details available?", "", maintainer, "",
    "### Package purpose", "", purpose, "",
    "### Number of dependencies", "", dependencies, "",
    "### Is the package available from CRAN or bioconductor?", "", on_cran, "",
    "### If not CRAN or bioconductor, where is the package available?", "", "_No response_", "",
    "### Is source code available, accessible and documented (i.e., well-structured and including comments) or is the source code unavailable or not clearly commented.", "", code_documented, "",
    "### Number of downloads in the last 12 months", "", downloads, "",
    "### Bug reporting address is available (in DESCRIPTION)", "", bug_reporting, "",
    "### Does the package have one or more vignettes?", "", vignettes, "",
    "### Does the package have unit and/or function tests performed by the authors? Are they comprehensive? Are they well documented?", "", tests
  )
  issue <- list(body = paste(body, collapse = "\n"),
                url = "https://api.github.com/repos/x/y/issues/1",
                created_at = "2026-02-04", updated_at = "2026-02-04")
  calculate_pkg_score(list(issue))
}
