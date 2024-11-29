#' Extract functions from R scripts within a directory
#'
#' As any functions from high risk packages require testing for use in high risk
#' products, it is important to know which functions are used in the code.
#'
#' `extract_functions_from_file` extracts functions from a single file. Where the
#' file is a markdown (Rmd or qmd) or Sweave file (Rnw), the R code is first
#' extracted via the `knitr::purl` function.
#'
#' `extract_functions_from_dir` extracts all functions from R scripts within a
#' directory that match a specified pattern. Specific files can be chosen via
#' the `pattern` argument, which accepts regular expressions. Files that match
#' `pattern` will be parsed for functions.
#'
#'
#' @param dir one or more directory to search for R scripts
#' @param pattern pattern to match files (defaults to variations of R, Rmd, Rnw,
#' and qmd files, ignoring case)
#' @param ... additional arguments to `list.files`
#'
#' @return a dataframe with the function (fun) and it's parent package (package),
#' and accessed_via indicating whether the function was accessed directly from
#' the namespace with `::` or `:::`, otherwise it is empty.
#'
#' @note It is important to note that functions used inside e.g. `lapply` or
#' `sapply` are not considered functions by the code parser and may not be
#' extracted unless they are also used directly elsewhere in the code (e.g.
#' length will not be found if used within `lapply(..., length)`, but would be
#' found if there was an additional use of the length function elsewhere -
#' `length(x)`).
#'
#' @export
#' @rdname extract_functions
#'
#' @importFrom dplyr bind_rows distinct arrange
#' @seealso [getParseData()], [find_pkgs()]
#' @examples
#' # extract_functions_from_dir("dirname")
extract_functions_from_dir <- function(dir, pattern = ".(r|rnw|rmd|qmd)$", ...){
  files <- lapply(dir,
                  function(x) list.files(path = x,
                  pattern = pattern,
                  full.names = TRUE,
                  ignore.case = TRUE))
  out <- files |>
    unlist() |>
    lapply(extract_functions_from_file) |>
    bind_rows() |>
    distinct() |>
    arrange(fun)

  if(any(out$accessed_via == ":::"))
    warning("Use of an internal function detected.",
            "It is recommended against using internal package functions via ':::'")

  return(out)
}


#' @describeIn extract_functions Extract functions from a file
#'
#' @param file file to extract functions from
#' @export
#' @importFrom knitr purl
#'
#' @examples
#' # extract_functions_from_file("file.R")
extract_functions_from_file <- function(file){
  if(grepl(".([rq]md|rnw)$", tolower(file))){
    temp <- tempfile()
    purl(file, output = temp)
    file <- temp
  }
  parsed <- getParseData(parse(file))

  # functions referenced via namespace (:: or :::)
  ns <- grep("NS_GET", parsed$token)
  if(any(grepl("NS_GET_INT", parsed$token)))
    warning("Use of an internal function detected.",
            "It is recommended against using internal package functions via ':::'")
  if(length(ns) > 0){
    pkg <- parsed[ns - 1, "text"]
    fun <- parsed[ns + 1, "text"]
    nsfuns <- data.frame(
      fun = fun, package = pkg, accessed_via = parsed[ns, "text"]
    )
    # as we know the package for these functions, we can skip the find_pkgs step for them
    parsed <- parsed |>
      slice(-(ns + 1))
  }

  funs <- parsed |>
    filter(token == "SYMBOL_FUNCTION_CALL") |>
    distinct(text) |>
    unlist() |>
    find_pkgs() |>
    bind_cols(accessed_via = "")

  if(length(ns) > 0){
    funs <- bind_rows(funs, nsfuns)
  }

  return(funs)
}

#' Determine which package a function is from
#'
#' This function takes a character vector of function names and returns a dataframe
#' containing the package containing those functions.
#'
#' Objects that appear to be in the global environment will be indicated as `.GlobalEnv`.
#' Functions that are referenced via a namespace (i.e. `::` or `:::`)
#' may not indicate a package, particularly when the package is not loaded.
#'
#' Where the same function is found in multiple packages, all packages are returned.
#' This is particularly the case where functions are re-exported by multiple packages
#' (e.g. `dplyr::mutate` is also exported by `gtsummary`).
#'
#' Where the `conflicted` package is used, the package that takes priority is returned.
#'
#' @param funs a character vector of function names
#'
#' @return dataframe with the function (fun) and it's parent package (package),
#' each as strings
#'
#' @export
#' @importFrom conflicted conflict_scout
#'
#' @examples
#' find_pkgs("mutate")
find_pkgs <- function(funs){
  lapply(funs, function(x){
    pkg <- find(x) |>
      str_remove("package:")
    if(length(pkg) == 0) pkg <- ""
    if(x == "library") pkg <- "base"
    # if(length(pkg) > 1) pkg <- pkg[1] # first package takes priority
    if(pkg[1] == ".conflicts"){ # if the conflicted package is used
      z <- conflicted::conflict_scout()
      pkg <- z[[x]]
    }
    data.frame(fun = x,
               package = pkg)
  }) |>
    bind_rows()
}







