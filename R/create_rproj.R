#' Create an R Project File in your Academic Project
#'
#' @description \code{create_rproj()} finishes by way of command line what Rstudio will do
#' naturally. It will add a simple \code{.Rproj} file to your directory.
#'
#'
#' @param path the directory name for the project (e.g. "my-project", "dissertation", or whatever)
#' @param ... optional stuff, but you can ignore this
#'
#' @return \code{create_rproj()} creates an \code{.Rproj} file in your directory. It should be run
#' in the command line \emph{after} running \code{create_project{}} in the command line. You will NOT
#' need to do this if you elect to use Rstudio's interface for the creation of a project. Rstudio
#' will do that for you automatically.
#'
#' @examples
#'
#' \dontrun{
#' create_project("example") # creates new directory
#' create_rproj("example") # creates new \code{.Rproj} file in that directory
#' }
#'
#' @export

create_rproj <- function(path, ...) {
  resources = system.file('rproj', package='steveproj')
  files = list.files(resources, recursive = TRUE, include.dirs = TRUE)
  source = file.path(resources, files)
  target = file.path(path, files)
  #file.copy(resources, path)
  file.copy(source, target)
  file.rename(paste0(target), paste0(path,"/",path,".Rproj"))
  TRUE
}
