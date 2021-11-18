#' Create a Memo File for Your Academic Project
#'
#' @description \code{create_memo()} creates an R Markdown for a memo to go
#' with your academic project.
#'
#' @param path a path in which to place the memo file. Defaults to current
#' working directory in the absence of a user-specified argument. User-supplied
#' arguments here should be understood as subdirectories relative to current
#' working directory. Assume that the current working directory is something
#' like `/home/steve/`, then specifying a path of "Documents" in this argument
#' would create the memo file in `/home/steve/Documents`. Just be mindful about
#' your setup if you experiment with this argument.
#'
#' @return \code{create_memo()} creates a `memo.Rmd` file in the path
#' requested by user. Users can create a memo at any time during the submission
#' timeline of the academic project, but I think of these documents as
#' typically something a user writes when offered an opportunity to revise and
#' resubmit a manuscript. That would explain why the skeleton file is
#' structured the way it is.
#'
#' @examples
#'
#' \dontrun{
#' # Creates a `memo.Rmd` file in working directory
#' create_memo()
#'
#' # Creates a `memo.Rmd` in subdirectory of working directory
#'
#' create_memo("subdirectory")
#' }
#'
#' @export

create_memo <- function(path) {

  if (missing(path)) {
    current_dir <- getwd()
  } else {
    current_dir <- paste0(getwd(), "/", path)
  }

  if (file.exists(paste0(current_dir,"/memo.Rmd"))) {
    stop("memo.Rmd exists in the path. If you want a new one, delete this file, move it, or rename it.")
  }

  memo_file = system.file('other_docs', "memo.Rmd", package='steveproj')
  file.copy(memo_file, current_dir)
  TRUE
}
