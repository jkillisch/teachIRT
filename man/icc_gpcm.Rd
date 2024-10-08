% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/icc_gpcm.R
\name{icc_gpcm}
\alias{icc_gpcm}
\title{Plot ICCs using the GPCM}
\usage{
icc_gpcm(theta_range = c(-5, 5), alpha, delta)
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
Plot ICCs using the GPCM
}
\examples{
icc_gpcm(alpha = 2, delta = c(-3, -1, 2))
}
