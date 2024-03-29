% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Huber.R
\name{huber.lasso}
\alias{huber.lasso}
\title{Huber-Lasso estimator}
\usage{
huber.lasso(
  X,
  y,
  beta.ini,
  lambda,
  alpha = 2,
  adaptive = TRUE,
  intercept = TRUE,
  penalty.factor = rep(1, ncol(X))
)
}
\arguments{
\item{X}{design matrix, standardization is recommended.}

\item{y}{response vector.}

\item{beta.ini}{initial estimates of beta. If not specified, LADLasso estimates from \code{rq.lasso.fit()} in \code{rqPen}
is used. Otherwise, robust estimators are strongly recommended.}

\item{lambda}{regularization parameter of Lasso or adaptive Lasso (if adaptive=TRUE).}

\item{alpha}{1/alpha is the huber tuning parameter. Larger alpha results in smaller portion of squared loss.}

\item{adaptive}{logical input that indicates if adaptive Lasso is used. Default is TRUE.}

\item{intercept}{logical input that indicates if intercept needs to be estimated. Default is FALSE.}

\item{penalty.factor}{can be used to force nonzero coefficients. Default is rep(1, ncol(X)) as in glmnet.}
}
\value{
\item{beta}{the regression coefficient estimates.}
\item{fitted}{predicted response.}
\item{iter.steps}{iteration steps.}
}
\description{
This function is L1 penalized Huber estimator for linear regression under both fixed and high-dimensional settings.
Currently, the function does not support automatic selection of huber tuning parameter.
}
\examples{
set.seed(2017)
n=200; d=500
X=matrix(rnorm(n*d), nrow=n, ncol=d)
beta=c(rep(2,6), rep(0, d-6))
y=X\%*\%beta+c(rnorm(150), rnorm(30,10,10), rnorm(20,0,100))
output.HuberLasso=huber.lasso(X,y)
beta.est=output.HuberLasso$beta

}
