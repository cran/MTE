% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MTE.R
\name{MTElasso}
\alias{MTElasso}
\title{MTE-Lasso estimator}
\usage{
MTElasso(
  X,
  y,
  beta.ini,
  p = 2,
  lambda = NULL,
  adaptive = TRUE,
  t = 0.01,
  intercept = TRUE,
  penalty.factor = rep(1, ncol(X)),
  ...
)
}
\arguments{
\item{X}{design matrix, standardization is recommended.}

\item{y}{response vector.}

\item{beta.ini}{initial estimates of beta. If not specified, LADLasso estimates from \code{rq.lasso.fit()} in \code{rqPen}
is used. Otherwise, robust estimators are strongly recommended.}

\item{p}{Taylor expansion order.}

\item{lambda}{regularization parameter for LASSO, but not necessary if "adaptive=TRUE".}

\item{adaptive}{logic argument to indicate if Adaptive-Lasso is used. Default is TRUE.}

\item{t}{the tuning parameter that controls for the tradeoff between robustness and efficiency. Default is t=0.01.}

\item{intercept}{logical input that indicates if intercept needs to be estimated. Default is FALSE.}

\item{penalty.factor}{can be used to force nonzero coefficients. Default is rep(1, ncol(X)) as in glmnet.}

\item{...}{other arguments that are used in \code{glmnet}.}
}
\value{
It returns a sparse vector of estimates of linear regression. It has two types of penalty, LASSO and AdaLasso.
Coordinate descent algorithm is used for iteratively updating coefficients.
\item{beta}{sparse regression coefficient}
\item{fitted}{predicted response}
}
\description{
MTELasso is the penalized MTE for robust estimation and variable selection for linear regression.
It can deal with both fixed and high-dimensional settings.
}
\examples{
set.seed(2017)
n=200; d=500
X=matrix(rnorm(n*d), nrow=n, ncol=d)
beta=c(rep(2,6), rep(0, d-6))
y=X\%*\%beta+c(rnorm(150), rnorm(30,10,10), rnorm(20,0,100))
output.MTELasso=MTElasso(X, y, p=2, t=0.01)
beta.est=output.MTELasso$beta

}
