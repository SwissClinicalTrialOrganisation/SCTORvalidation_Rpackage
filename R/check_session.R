#' Check a sessions loaded packages against the risk assessed packages list from GitHub
#'
#' This function downloads the lists of risk assessed and tested packages from
#' GitHub and compares them to the packages loaded in the current R session.
#' @param product_risk character vector, which product risk levels should be included in the report (default: c("low", "medium", "high"))
#' @param attached_only logical, should all loaded packages be shown (FALSE; default), or only those that are attached (TRUE)
#' @param approved_only logical, should only validated (approved) packages be shown (TRUE; default), or also those awaiting approval (FALSE)
#' @export
#' @importFrom sessioninfo package_info
#' @importFrom dplyr filter left_join join_by first mutate summarize if_else across select
#' @rdname check_session
#' @examples
#' \dontrun{
#' check_session()
#' }
check_session <- function(product_risk = c("low", "medium", "high"),
                          attached_only = TRUE, approved_only = TRUE){
  attached <- package <- loadedversion <- NULL

  # session info
  session <- package_info()
  session_info <- sessionInfo()
  r_vers <- paste(version$major, version$minor, sep = ".")
  this_os <- session_info$running

  loaded <- session |>
    # filter(attached) |>
    as.data.frame()

  if(attached_only)
    loaded <- loaded |> filter(attached)

  # validated packages & functions
  validated <- load_pkg_table()
  tests <- load_tests_table()

  paks <- loaded |>
    left_join(validated,
              by = "package") |>
    mutate(same_version_available = max(loadedversion == version),
           same_version = loadedversion == version,
           .by = package) |>
    filter(is.na(same_version_available) | same_version | !same_version_available)
  tested <- loaded |>
    left_join(tests, by = "package")

  # filter packages according to "validation" status
  # ok_paks <- paks |>
  #   filter(loadedversion == version)
  #
  # diff_version <- paks |>
  #   filter(version != loadedversion,
  #          !package %in% ok_paks$package)
  #
  # unvalidated <- paks |>
  #   filter(is.na(version))

  # report packages with tests
  these_tests <- tested |>
    filter(!is.na(test_result)) |>
    mutate(test_on_os = os == this_os,
           test_on_rversion = r_version == r_vers) |> #names()
    # left_join(paks |>
    #             select(package, version, final_score_cat)
    #           , by = join_by(package, loadedversion == version)) |>
    summarize(.by = c(package),
              test_on_os = any(test_on_os),
              # tested_oss = paste(os, collapse = ", "),
              test_on_rversion = any(test_on_rversion),
              # tested_rversions = paste(r_version, collapse = ", "),
              # final_score_cat = first(final_score_cat)
              )

  ra_tests <- paks |>
    mutate(ra_sameversion = loadedversion == version,
           ra_diffversion = loadedversion != version,
           ra_none = is.na(version)) |>
    left_join(these_tests, by = join_by(package)) |>
    mutate(any_tests = !is.na(test_on_os),
           across(ra_sameversion:test_on_rversion , ~ if_else(!is.na(.x), .x, FALSE))) |> #names()
    select(package, loadedversion, attached, is_base, install_date = date,
           source, issue_url, final_score_cat, ra_sameversion, ra_diffversion,
           ra_none, any_tests, test_on_os, test_on_rversion)

  tests_version_os <- these_tests |>
    filter(test_on_os & test_on_rversion)
  tests_diffversion <- these_tests |>
    filter(!test_on_rversion)
  tests_diffos <- these_tests |>
    filter(!test_on_os)


  # return object
  out <- list(
    data = ra_tests,
    # not_validated = unvalidated,
    # different_version = diff_version,
    # validated = ok_paks,
    n_packages = nrow(loaded),
    tests_ok = tests_version_os,
    tests_diffversion = tests_diffversion,
    tests_diffos = tests_diffos,
    attached_only = attached_only
  )

  class(out) <- c("sctovalidity", class(out))

  return(out)
}



#' @param x output from \code{check_session}
#' @param ... options passed to methods
#' @rdname check_session
#' @export
#' @importFrom glue glue
#' @importFrom crayon yellow red
#' @importFrom dplyr pull
#' @importFrom cli cli_h1 cli_h2 cli_h3 cli_alert_success cli_alert_warning cli_alert_danger cli_inform
print.sctovalidity <- function(x, ...){

  cli_h1("Summary of packages in the session: \n")
  if(x$attached_only) cli_inform("Only explicitly loaded packages are included.\n")

  n_pkg <- nrow(x$data)
  n_ra <- nrow(x$data |> filter(!is.na(final_score_cat), ra_sameversion))
  n_diff <- nrow(x$data |> filter(!is.na(final_score_cat), ra_diffversion))
  n_nora <- nrow(x$data |> filter(is.na(final_score_cat)))

  n_tests_ok <- nrow(x$data |> filter(test_on_os, test_on_rversion))
  n_tests_diffversion <- nrow(x$data |> filter(!test_on_rversion & any_tests))
  n_tests_diffos <- nrow(x$data |> filter(!test_on_os & any_tests))

  highrisk <- x$data |> filter(final_score_cat == "High")
  mediumrisk <- x$data |> filter(final_score_cat == "Medium")

  cli_h2("Package risk assessments: \n")
  cli_h3("Of {n_pkg} loaded packages, ")
  cli_alert_success("{n_ra} {pluralize_has(n_ra)} been risk assessed, ")
  cli_alert_warning("{n_diff} {pluralize_is(n_diff)} a different version of a risk assessed package, ")
  cli_alert_danger("{n_nora} {pluralize_has(n_nora)} not been risk assessed to date. ")

  if(nrow(x$data |> filter(is.na(final_score_cat))) > 0){
    cli_inform("The following packages require risk assessment:")
    lapply(x$data |> filter(is.na(final_score_cat)) |> pull(package),
           function(x) cli_inform(c("*" = x)))
  }
  if(nrow(x$data |> filter(is.na(final_score_cat), ra_diffversion)) > 0){
    cli_inform("Consider updating the risk assessment for the following packages:",)
    lapply(x$data |> filter(is.na(final_score_cat), ra_diffversion) |> pull(package),
           function(x) cli_inform(c("*" = x)))
  }

  cli_h2("Packages with tests: \n")
  cli_h3("Of {x$n_packages} loaded packages, ")

  cli_alert_success("{n_tests_ok} {pluralize_has(n_tests_ok)} tests on this R version and OS. ")
  if(n_tests_diffversion > 0){
    cli_alert_warning("{n_tests_diffversion} {pluralize_is(n_tests_diffversion)} tested on different R version. ")
    lapply(x$data |> filter(!test_on_rversion & any_tests) |> pull(package),
           function(x) cli_inform(c("*" = x)))
  }
  if(n_tests_diffos > 0){
    cli_alert_warning("{n_tests_diffos} {pluralize_was(n_tests_diffos)} tested on a different operating system. ")
    lapply(x$data |> filter(!test_on_os & any_tests) |> pull(package),
           function(x) cli_inform(c("*" = x)))
  }

  # high risk packages ----
  cli_h2("There {pluralize_is(nrow(highrisk))} {nrow(highrisk)} high risk package(s)")
  if(highrisk |> filter(!any_tests) |> nrow() > 0){
    cli_inform("The following packages have no tests")
    lapply(highrisk |> filter(!any_tests) |> pull(package),
           function(x) cli_inform(c("*" = x)))
  }
  if(highrisk |> filter(any_tests) |> nrow() > 0){
    cli_inform("The following packages have tests. Check their sufficiency for you use-case.")
    lapply(highrisk |> filter(any_tests) |> pull(package),
           function(x) cli_inform(c("*" = x)))
  }

  # medium risk packages ----
  cli_h2("There {pluralize_is(nrow(mediumrisk))} {nrow(mediumrisk)} medium risk package(s)")

  mediumrisk |> filter()

  # cat(glue("Packages with tests: \n",
  #          "\n  {n_tests_ok} {pluralize_has(n_tests_ok)} been tested on the current R version and OS, ",
  #          "\n  {n_tests_diffversion} {pluralize_has(n_tests_diffversion)} been tested on a different R version, ",
  #          "\n  and {n_tests_diffos} {pluralize_has(n_tests_diffos)} been tested on a different OS.", "\n\n"))

  # if(nrow(x$different_version) > 0){
  #   cat(yellow("Consider updating the validation on the following packages:\n"),
  #       paste(x$different_version$package, sep = ", "), "\n")
  # }
  # if(nrow(x$not_validated) > 0){
  #   cat(red("The following packages require validation:\n"),
  #     paste(x$not_validated$package, sep = ", "), "\n")
  # }
  # if(n_tests_diffversion > 0){
  #   cat(red("The following packages have tests on the platform, but on a different R version:\n"),
  #     paste(x$tests_diffversion$package, sep = ", "), "\n")
  # }
  # if(n_tests_diffos > 0){
  #   cat(red("The following packages have tests on the platform, but on a different operating system:\n"),
  #     paste(x$tests_diffos$package, sep = ", "), "\n")
  # }

  cli_inform("See {.url https://swissclinicaltrialorganisation.github.io/pkg_validation/} for further details on package validation within the SCTO framework")

  return(NULL)

}


