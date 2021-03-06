% Generated by roxygen2 (4.1.1.9000): do not edit by hand
% Please edit documentation in R/countAdultsInRadius.R
\name{countAdultsInRadius}
\alias{countAdultsInRadius}
\title{Count Adults In Radius}
\usage{
countAdultsInRadius(searchPoint, forest, m)
}
\arguments{
\item{searchPoint}{An (x,y) vector of an "origin" point to search from.}

\item{forest}{An (x,y) data.frame of search points.}

\item{m}{The radius to search by.}
}
\value{
This function returns a number representing the total number of
  records found. This function operates on the dist() function in R, and does
  not search in a square, but rather, a circle.
}
\description{
This function searches in a radius around a series of x,y points and finds
any points within a radius, m, of those points.
}
\examples{
countAdultsInRadius(c(1,2), data.frame(x=c(1:5), y=c(1:5)),6)
}

