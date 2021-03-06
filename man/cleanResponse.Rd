% Generated by roxygen2 (4.1.1.9000): do not edit by hand
% Please edit documentation in R/cleanResponse.R
\name{cleanResponse}
\alias{cleanResponse}
\title{Internal Function To Clean ResponseTable}
\usage{
cleanResponse(responsetable, rm.rows = 0)
}
\arguments{
\item{responsetable}{A data.frame that needs to be cleaned.}

\item{rm.rows}{The rows to remove, if needed. Default is first row.}
}
\description{
This function takes a data.frame that has NA's in its first row from when it
got populated, removes that first row and returns a cleaned response, OR
tells you that the response was empty to begin with.
}
\examples{
## negative response
sampleresponse <- data.frame(col1=NA, col2=NA)
#cleanResponse(sampleresponse,1)

## positive response
sampleresponse <- rbind(sampleresponse, c(1, 2), c(3, 4))
cleanResponse(sampleresponse, 1)
}

