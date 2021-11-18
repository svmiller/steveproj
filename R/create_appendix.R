#' Create an Appendix File for Your Academic Project
#'
#' @description \code{create_appendix()} creates an R Markdown for an appendix
#' to go with your academic project.
#'
#' @param path a path in which to place the appendix file. Defaults to current
#' working directory in the absence of a user-specified argument. User-supplied
#' arguments here should be understood as subdirectories relative to current
#' working directory. Assume that the current working directory is something
#' like `/home/steve/`, then specifying a path of "Documents" in this argument
#' would create the memo file in `/home/steve/Documents`. Just be mindful about
#' your setup if you experiment with this argument.
#'
#' @return \code{create_appendix()} creates a `appendix.Rmd` file in the path
#' requested by user. Users can create an appendix at any time during the
#' submission timeline of the academic project, but I often---but not
#' always---create them at the revise-and-resubmit phase. That would explain
#' why it's not a default file.
#'
#' @examples
#'
#' \dontrun{
#' # Creates a `appendix.Rmd` file in working directory
#' create_appendix()
#'
#' # Creates a `appendix.Rmd` in subdirectory of working directory
#'
#' create_appendix("subdirectory")
#' }
#'
#' @export

create_appendix <- function(path) {

  if (missing(path)) {
    current_dir <- getwd()
  } else {
    current_dir <- paste0(getwd(), "/", path)
  }

  if (file.exists(paste0(current_dir,"/appendix.Rmd"))) {
    stop("appendix.Rmd exists in the path. If you want a new one, delete this file, move it, or rename it.")
  }

  memo_file = system.file('other_docs', "appendix.Rmd", package='steveproj')
  file.copy(memo_file, current_dir)
  TRUE
}
