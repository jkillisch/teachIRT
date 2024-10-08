% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inf_rasch.R
\name{inf_rasch}
\alias{inf_rasch}
\title{Compute information at theta using the Rasch model}
\usage{
inf_rasch(theta, beta)
}
\arguments{
\item{theta}{Numeric, latent ability}

\item{beta}{Numeric, item difficulty}
}
\value{
Numeric, information
}
\description{
Compute information at theta using the Rasch model
}
\examples{
inf_rasch(theta = 0.5, beta = 0.4)
}
