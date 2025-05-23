% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_session.R
\name{check_session}
\alias{check_session}
\alias{print.sctovalidity}
\title{Check a sessions loaded packages against the risk assessed packages list from GitHub}
\usage{
check_session(
  product_risk = c("low", "medium", "high"),
  attached_only = TRUE,
  approved_only = TRUE
)

\method{print}{sctovalidity}(x, ...)
}
\arguments{
\item{product_risk}{character vector, which product risk levels should be included in the report (default: c("low", "medium", "high"))}

\item{attached_only}{logical, should all loaded packages be shown (FALSE; default), or only those that are attached (TRUE)}

\item{approved_only}{logical, should only validated (approved) packages be shown (TRUE; default), or also those awaiting approval (FALSE)}

\item{x}{output from \code{check_session}}

\item{...}{options passed to methods}
}
\description{
This function downloads the lists of risk assessed and tested packages from
GitHub and compares them to the packages loaded in the current R session.
}
\examples{
\dontrun{
check_session()
}
}
