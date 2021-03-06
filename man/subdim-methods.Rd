% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/InfinitySparseMatrix.R, R/Ops.optmatch.dlist.R
\docType{methods}
\name{subdim}
\alias{subdim}
\alias{subdim.BlockedInfinitySparseMatrix}
\alias{subdim.InfinitySparseMatrix}
\alias{subdim.matrix}
\alias{subdim.optmatch.dlist}
\title{Returns the dimension of each valid subproblem}
\usage{
subdim(x)

\method{subdim}{InfinitySparseMatrix}(x)

\method{subdim}{matrix}(x)

\method{subdim}{BlockedInfinitySparseMatrix}(x)

\method{subdim}{optmatch.dlist}(x)
}
\arguments{
\item{x}{A distance specification to get the sub-dimensions of.}
}
\value{
A list of the dimensions of each valid subproblem. Any subproblems with 0 controls
or 0 treatments will be ignored. The names of the entries in the list will be the names of the
subproblems, if they exist.
}
\description{
Returns a list containing the dimensions of all valid subproblems.
}

