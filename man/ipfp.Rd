\name{ipfp}
\alias{ipfp}
\title{Function to run basic IPFP (iterative proportional fitting procedure)}
\usage{
ipfp(y, A, x0, tol = .Machine$double.eps, maxit = 1000, verbose = FALSE,
  full = FALSE)
}
\arguments{
  \item{y}{numeric constraint vector (length nrow)}

  \item{A}{constraint matrix (nrow x ncol)}

  \item{x0}{numeric initial vector (length ncol)}

  \item{tol}{numeric tolerance for IPFP; defaults to
  \code{.Machine$double.eps}}

  \item{maxit}{integer maximum number of iterations for
  IPFP; defaults to 1e3}

  \item{verbose}{logical parameter to select verbose output
  from C function}

  \item{full}{logical parameter to select full return (with
  diagnostic info)}
}
\value{
if not full, vector of length ncol containing solution
obtained by IPFP. If full, list containing solution (as x),
number of iterations (as iter), and norm of Ax - y (as
errNorm)
}
\description{
Use IPFP starting from x0 to produce vector x s.t. Ax = y
within tolerance. Need to ensure that x0 >= 0.
}
\examples{
A <- buildStarMat(3)
x <- rgamma(ncol(A), 10, 1/100)
y <- A \%*\% x
x0 <- x * rgamma(length(x), 10, 10)
ans <- ipfp(y, A, x0, full=TRUE)
print(ans)
print(x)
}
\keyword{array}
\keyword{iteration}

