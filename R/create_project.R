#' Create an Academic Project/Paper Project (i.e. a Steve Project)
#'
#' @description \code{create_project()} provides a convenient function for creating
#' a new academic/paper project.
#'
#'
#' @param path the directory name for the project (e.g. "my-project", "dissertation", or whatever)
#' @param ... optional stuff, but you can ignore this
#'
#' @return \code{create_project()} creates a directory named with whatever is supplied in the \code{path} variable. This
#' directory will appear in the current working directory if it is executed in the command line. The contents of that
#' directory will include a skeleton project to get the user started. The user can (and must) ultimately make it their own.
#'
#' @examples
#'
#' \dontrun{
#' create_project("example")
#' create_project("dissertation")
#' }
#'
#' @export
create_project <- function(path, ...) {

  # ensure directory exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # copy 'resources' folder to path
  resources = system.file('rstudio', 'templates', 'project', 'resources', package='steveproj')
  #
  files = list.files(resources, recursive = TRUE, include.dirs = TRUE)
  #
  source = file.path(resources, files)
  target = file.path(path, files)
  # file.copy(source, target, recursive=TRUE)
  dir.create(paste0(path,"/src"))
  dir.create(paste0(path,"/R"))
  dir.create(paste0(path,"/doc"))
  dir.create(paste0(path,"/data"))
  dir.create(paste0(path,"/inst"))
  #file.copy(resources, path)
  file.copy(source, target)
  TRUE
}

# Callback is at: inst/rstudio/templates/project/create_project.dcf
