% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/occ_grm.R
\name{occ_grm}
\alias{occ_grm}
\title{Plot OCCs using the GRM}
\usage{
occ_grm(theta_range = c(-5, 5), alpha, delta)
}
\arguments{
\item{theta_range}{Numeric vector of length 2, range of x-/theta-axis}

\item{alpha}{Numeric, item discrimination parameter}

\item{delta}{Numeric vector, threshold parameters}
}
\value{
A ggplot2 object
}
\description{
Plot OCCs using the GRM
}
\examples{
occ_grm(alpha = 1.2, delta = c(-2, -0.5, 1.5))
}
