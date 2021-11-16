#' Download Citation Style Language (CSL) File from Github
#'
#' @description \code{dl_csl()} will download a requested citation style language (CSL) file from the
#' Github repository of CSL files.
#'
#' @details \code{dl_csl()} assumes an active internet connection. The function also builds in a few implicit defaults.
#' If a file matching the requested CSL exists, the function does nothing. If the requested CSL does not have a ".csl"
#' extension, the function assumes you forgot it and adds it for you. By default, the function downloads the CSL file
#' and sticks it in your "inst" folder in the working directory. You can change this if you'd like with the \code{dir}
#' argument. If the directory does not exist, the function creates it for you. If you'd like the CSL file in the current
#' directory, set the \code{dir} argument to be \code{NULL}. The Github repository of CSL files is available here:
#' \url{https://github.com/citation-style-language/styles}.
#'
#'
#' @param csl a valid CSL file on the GIthub repository of CSL files, with or without file extension
#' @param dir the subdirectory in the working directory in which you want the CSL file, defaults to "inst". A user who wants
#' the CSL file in their current working directory should set this to be \code{NULL}.
#'
#' @return \code{dl_csl()} takes a requested CSL file (from the Github repository) and an optional subdirectory,
#' downloads the CSL file, and sticks it in the requested directory.
#'
#' @examples
#'
#' \dontrun{
#' dl_csl("american-political-science-association.csl")
#' # ^ Works, has extension too
#' dl_csl("journal-of-peace-research")
#' # ^ Will also work, but message you that it assumes you forgot ".csl"
#' }
#'
#' @export
dl_csl <- function(csl, dir="inst") {

  if (!is.null(dir) && !dir.exists(dir)) {
    dir.create(dir)
  }

  if (tools::file_ext(csl)!="csl") {
    message("I'm going to assume you forgot to add the .csl extension. I'll add that for you.")
    csl <- paste0(csl, ".csl")
  }

  if (!is.null(dir) && !file.exists(paste0(dir,"/",csl))) {
  cslurl <- file.path("https://raw.githubusercontent.com/citation-style-language/styles/master", csl)
  message(paste("Downloading CSL from", cslurl))
  cslresp <- GET(cslurl, write_disk(csl))

  if(http_error(cslresp)) {
    file.remove(csl)
    stop(paste("Could not download CSL.", "Code:", status_code(cslresp)))
  }

  file.copy(csl, dir)
  file.remove(csl)

  }

  if (is.null(dir) && !file.exists(csl)) {

    cslurl <- file.path("https://raw.githubusercontent.com/citation-style-language/styles/master", csl)
    message(paste("Downloading CSL from", cslurl))
    cslresp <- GET(cslurl, write_disk(csl))

    if(http_error(cslresp)) {
      file.remove(csl)
      stop(paste("Could not download CSL.", "Code:", status_code(cslresp)))
    }

  }

}
