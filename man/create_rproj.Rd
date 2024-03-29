% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_rproj.R
\name{create_rproj}
\alias{create_rproj}
\title{Create an R Project File in your Academic Project}
\usage{
create_rproj(path, ...)
}
\arguments{
\item{path}{the directory name for the project (e.g. "my-project", "dissertation", or whatever)}

\item{...}{optional stuff, but you can ignore this}
}
\value{
\code{create_rproj()} creates an \code{.Rproj} file in your directory. It should be run
in the command line \emph{after} running \code{create_project{}} in the command line. You will NOT
need to do this if you elect to use Rstudio's interface for the creation of a project. Rstudio
will do that for you automatically.
}
\description{
\code{create_rproj()} finishes by way of command line what Rstudio will do
naturally. It will add a simple \code{.Rproj} file to your directory.
}
\examples{

\dontrun{
create_project("example") # creates new directory
create_rproj("example") # creates new \code{.Rproj} file in that directory
}

}
