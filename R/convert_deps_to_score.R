#' Convert number of dependencies to a score
#'
#' Risk score in [0, 1] from the number of dependencies, following the
#' riskmetric package: a logistic curve with midpoint 4 and growth rate 0.5,
#' \deqn{s(x) = 1 / (1 + exp(-0.5 (x - 4)))}
#' rescaled so that 0 dependencies give 0:
#' \deqn{score = (s(x) - s(0)) / (1 - s(0))}
#' This is metric 5 of the SCTO package risk assessment SOP.
#'
#' See \href{https://pharmar.github.io/riskmetric/reference/metric_score.pkg_metric_dependencies.html}{riskmetric documentation} for further details.
#' @param deps number of dependencies
#' @keywords internal
#' @seealso \href{https://pharmar.github.io/riskmetric/reference/metric_score.pkg_metric_dependencies.html}{riskmetric documentation},
#'   \code{\link{convert_downloads_to_score}}
convert_deps_to_score <- function(deps){
  s <- 1/(1 + exp(-0.5 * (deps - 4)))
  min_original <- 1/(1 + exp(-0.5 * (0 - 4)))
  domain_mapper(s, min_original = min_original)
}
