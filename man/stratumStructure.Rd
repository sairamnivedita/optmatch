% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stratumStructure.R
\name{stratumStructure}
\alias{print.stratumStructure}
\alias{stratumStructure}
\alias{stratumStructure.default}
\alias{stratumStructure.optmatch}
\title{Return structure of matched sets}
\usage{
stratumStructure(stratum, trtgrp = NULL, min.controls = 0,
  max.controls = Inf)

\method{stratumStructure}{optmatch}(stratum, trtgrp, min.controls = 0,
  max.controls = Inf)

\method{stratumStructure}{default}(stratum, trtgrp, min.controls = 0,
  max.controls = Inf)

\method{print}{stratumStructure}(x, ...)
}
\arguments{
\item{stratum}{Matched strata, as returned by
\code{\link{fullmatch}} or \code{\link{pairmatch}}}

\item{trtgrp}{Dummy variable for treatment group membership.  (Not
required if \code{stratum} is an optmatch object, as returned by
\code{\link{fullmatch}} or \code{\link{pairmatch}}.)}

\item{min.controls}{For display, the number of treatment group
members per stratum will be truncated at the reciprocal of
\code{min.controls}.}

\item{max.controls}{For display, the number of control group
members will be truncated at \code{max.controls}.}

\item{x}{stratumStructure object to be printed.}

\item{...}{Additional arguments to \code{print}.}
}
\value{
A table showing frequency of occurrence of those
  treatment:control ratios that occur.

  The \sQuote{effective sample size} of the stratification, in
  matched pairs.  Given as an attribute of the table, named
  \sQuote{\code{comparable.num.matched.pairs}}; see Note.
}
\description{
Tabulate treatment:control ratios occurring in matched sets, and
the frequency of their occurrence.
}
\note{
For comparing treatment and control groups both of size 10,
  say, a stratification consisting of two strata, one with 9
  treatments and 1 control, has a smaller \sQuote{effective sample
  size}, intuitively, than a stratification into 10 matched pairs,
  despite the fact that both contain 20 subjects in
  total. \code{stratumStructure} first summarizes this aspect of
  the structure of the stratification it is given, then goes on to
  identify one number as the stratification's effective sample
  size.  The \sQuote{\code{comparable.num.matched.pairs}}
  attribute returned by \code{stratumStructure} is the sum of
  harmonic means of the sizes of the treatment and control
  subgroups of each stratum, a general way of calibrating such
  differences as well as differences in the number of subjects
  contained in a stratification.  For example, by this metric the
  9:1, 1:9 stratification is comparable to 3.6 matched pairs.

  Why should effective sample size be calculated this way?  The
  phrase \sQuote{effective sample size} suggests the observations
  are taken to be similar in information content.  Modeling them
  as random variables, this suggests that they be assumed to have
  the same variance, \eqn{\sigma}{sigma}, conditional on what
  stratum they reside in.  If that is the case, and if also
  treatment and control observations differ in expectation by a
  constant that is the same for each stratum, then it can be shown
  that the optimum weights with which to combine treatment-control
  contrasts across strata, \eqn{s}{s}, are proportional to the
  stratum-wise harmonic means of treatment and control counts,
  \eqn{h_s = [(n_{ts}^{-1} + n_{cs}^{-1})/2]^{-1}}{h[s] =
  1/(0.5/n.t[s] + 0.5/n.c[s])} (Kalton, 1968).  The thus-weighted
  average of contrasts then has variance \eqn{2\sigma/\sum_s
  h_s}{2*sigma/sum(h)}. This motivates the use of \eqn{\sum_s
  h_s}{sum(h)} as a measure of effective sample size.  Since for a
  matched pair \eqn{s}{s}, \eqn{h_s=1}{h[s]=1}, \eqn{\sum_s
  h_s}{sum(h)} can be thought of as the number of matched pairs
  needed to attain comparable precision.  (Alternately, the
  stratification might be taken into account when comparing
  treatment and control groups using fixed effects in an ordinary
  least-squares regression, as in Hansen (2004). This leads to the
  same result.  A still different formulation, in which outcomes
  are not modeled as random variables but assignment to treatment
  or control is, again suggests the same weighting across strata,
  and a measure of precision featuring \eqn{\sum_s h_s}{sum(h)} in
  a similar role; see Hansen and Bowers (2008).
}
\examples{
data(plantdist)
plantsfm <- fullmatch(plantdist) # A full match with unrestricted
                                 # treatment-control balance
plantsfm1 <- fullmatch(plantdist,min.controls=2, max.controls=3)
stratumStructure(plantsfm)
stratumStructure(plantsfm1)
stratumStructure(plantsfm, max.controls=4)

}
\author{
Ben B. Hansen
}
\references{
Kalton, G. (1968), \sQuote{Standardization: A
  technique to control for extraneous variables}, \emph{Applied
  Statistics}, \bold{17}, 118--136.

  Hansen, B.B. (2004), \sQuote{Full Matching in an Observational
  Study of Coaching for the SAT}, \emph{Journal of the American
  Statistical Association}, \bold{99}, 609--618.

  Hansen B.B. and Bowers, J. (2008), \sQuote{Covariate balance in
  simple, stratified and clustered comparative studies},
  \emph{Statistical Science}, \bold{23}, to appear.
}
\seealso{
\code{\link{matched}}, \code{\link{fullmatch}}
}

