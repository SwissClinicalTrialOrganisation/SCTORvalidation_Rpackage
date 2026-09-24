#' Convert number of downloads to a score
#'
#' Risk score in [0, 1] from the number of downloads in the last 12 months,
#' following the riskmetric package's simplification of the logistic curve:
#' \deqn{score = 1.5 / (downloads / 100000 + 1.5)}
#' 0 downloads give 1, 150,000 give 0.5, many downloads approach 0. \code{NA}
#' counts as 0 downloads. This is metric 8 of the SCTO package risk
#' assessment SOP.
#'
#' See \href{https://pharmar.github.io/riskmetric/reference/metric_score.pkg_metric_downloads_1yr.html}{riskmetric documentation} for further details.
#' @param downloads number of downloads
#' @keywords internal
#' @seealso \href{https://pharmar.github.io/riskmetric/reference/metric_score.pkg_metric_downloads_1yr.html}{riskmetric documentation},
#'   \code{\link{convert_deps_to_score}}
convert_downloads_to_score <- function(downloads){
  downloads[is.na(downloads)] <- 0
  1.5 / (downloads / 1e5 + 1.5)
}
