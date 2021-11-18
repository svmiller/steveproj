#' Render Your R Markdown Memo to Various Outputs
#'
#' @description `render_memo()` takes various arguments, most effectively built
#' into the function, and renders your R Markdown memo to various outputs
#' supported by \pkg{stevetemplates}.
#'
#'
#' @param file the name of the R Markdown file containing that is your
#' memo Defaults to "memo.Rmd".
#' @param output_dir the output directory to contain the formatted manuscript.
#' Defaults to "doc". Optimally, this is a subdirectory of the directory
#' containing the manuscript. A user who wants the formatted manuscript
#' to be in the same directory as the R Markdown file should specify
#' `output_dir = NULL` here.
#' @param outputs the various formatted manuscript types the user wants,
#' supplied as a character vector. Must be one or more of "pdf", "pdf-anon",
#' "word", and/or "html". No other formats are supported right now.
#' @param latex_engine the LaTeX engine the user may want to use.
#' Defaults to `"xelatex"`. You can overwrite this if you would like, but
#' why would you?
#' @param dev the graphics device for LaTeX PDFs. Defaults to `"cairo_pdf"`.
#' You can overwrite this, but why would you?
#'
#' @return `render_memo()` takes various arguments, most effectively built
#' into the function, and renders your R Markdown memo to various outputs
#' supported by \pkg{stevetemplates}.
#'
#' @examples
#'
#' \dontrun{
#' render_memo()
#' }
#'
#' @export
#'

render_memo <- function(file = "memo.Rmd", output_dir = "doc",
                      outputs = c("pdf", "word"),
                      latex_engine = "xelatex",  dev = "cairo_pdf") {

  if (!all(outputs %in% c("pdf", "word"))) {
    stop("Invalid outputs are specified. Valid entries here are limited to 'pdf', 'pdf-anon', 'word', and 'html'")
  }

  if(pandoc_available() == FALSE) {
    stop("R can't find a version of pandoc to use. RStudio has a version of pandoc built into it, but using the original command line interface may lead to an issue like this. Solving this will depend on your particular set up. This solution on Stack Overflow may point to a potential workaround, certainly if you have RStudio installed: https://stackoverflow.com/questions/35624025/pandoc-from-rsudio-server-not-recognized-when-running-script-via-cron")
  }


  file_split <- unlist(strsplit(file,"[.]"))
  file_name <- file_split[1]

  if("pdf" %in% outputs) {


    if(is.null(output_dir)) {

      file_location <- paste0(file_name,".pdf")
    } else { # assuming an output directory is specified

      file_location <- paste0(output_dir,"/",file_name,".pdf")


      }

  render(input = file,
                    output_file = file_location,
                    pdf_document2(template = templ_cover_letter(),
                                            latex_engine = "xelatex", dev="cairo_pdf", toc = FALSE,
                                            number_sections = FALSE))

  }


  if("word" %in% outputs) {


    if(is.null(output_dir)) {

      file_location <- paste0(file_name,".docx")
    } else { # assuming an output directory is specified

      file_location <- paste0(output_dir,"/",file_name,".docx")


    }

  render(input = file,
                    output_file = file_location,
                    word_document2(reference_docx = templ_word(),
                                             toc = FALSE, number_sections = FALSE))
  }


}

