#' Render Your R Markdown Manuscript to Various Outputs
#'
#' @description `render_ms()` takes various arguments, most effectively built
#' into the function, and renders your R Markdown manuscript to various outputs
#' supported by \pkg{stevetemplates}.
#'
#'
#' @param file the name of the R Markdown file containing that is your
#' manuscript. Defaults to "ms.Rmd".
#' @param output_dir the output directory to contain the formatted manuscript.
#' Defaults to "doc". Optimally, this is a subdirectory of the directory
#' containing the manuscript. A user who wants the formatted manuscript
#' to be in the same directory as the R Markdown file should specify
#' `output_dir = NULL` here.
#' @param outputs the various formatted manuscript types the user wants,
#' supplied as a character vector. Must be one or more of "pdf", "pdf-anon",
#' "word", and/or "html". No other formats are supported right now.
#' @param parameters optional parameters, specified as a character, based on
#' what's in your R Markdown file, passed as `params` in the `render()`
#' function in R Markdown. If no parameters are specified here, the
#' function defaults these parameters to
#' `anonymous=TRUE, doublespacing=TRUE, removetitleabstract=TRUE`,
#' which is then wrapped in a list to be passed to the `params`
#' argument in `render()`. Do note this primarily concerns the anonymous
#' manuscript type. These are somewhat advanced-level arguments, so the user
#' should be careful what they do here and should have a firm idea what
#' they are doing here.
#' @param latex_engine the LaTeX engine the user may want to use.
#' Defaults to `"xelatex"`. You can overwrite this if you would like, but
#' why would you?
#' @param dev the graphics device for LaTeX PDFs. Defaults to `"cairo_pdf"`.
#' You can overwrite this, but why would you?
#'
#' @return `render_ms()` takes various arguments, most effectively built
#' into the function, and renders your R Markdown manuscript to various outputs
#' supported by \pkg{stevetemplates}.
#'
#' @examples
#'
#' \dontrun{
#' render_ms()
#' }
#'
#' @export
#'

render_ms <- function(file = "ms.Rmd", output_dir = "doc",
                      outputs = c("pdf", "pdf-anon", "word", "html"),
                      parameters, latex_engine = "xelatex",  dev = "cairo_pdf") {

  if (!all(outputs %in% c("pdf", "pdf-anon", "word", "html"))) {
    stop("Invalid outputs are specified. Valid entries here are limited to 'pdf', 'pdf-anon', 'word', and 'html'")
  }





  if(missing(parameters)) {
    the_params <- eval(parse(text = paste0("list(anonymous=TRUE, doublespacing=TRUE, removetitleabstract=TRUE)")))
  } else {
    the_params <- eval(parse(text = paste0("list(", parameters," )")))
  }


  file_split <- unlist(strsplit(file,"[.]"))
  file_name <- file_split[1]

  if("pdf" %in% outputs) {


    if(is.null(output_dir)) {

      file_location <- paste0(file_name,".pdf")
    } else { # assuming an output directory is specified

      file_location <- paste0(output_dir,"/",file_name,".pdf")


      }

  rmarkdown::render(input = file,
                    output_file = file_location,
                    bookdown::pdf_document2(template = stevetemplates::templ_article2(),
                                            latex_engine = "xelatex", dev="cairo_pdf", toc = FALSE,
                                            number_sections = FALSE))

  }

  if("pdf-anon" %in% outputs) {

    if(is.null(output_dir)) {

      file_location <- paste0(file_name,".pdf")
    } else { # assuming an output directory is specified

      file_location <- paste0(output_dir,"/",file_name,".pdf")


    }

  rmarkdown::render(input = file,
                    output_file = file_location,
                    params=the_params,
                    bookdown::pdf_document2(template = stevetemplates::templ_article2(),
                                            latex_engine = "xelatex", dev= "cairo_pdf", toc = FALSE,
                                            number_sections = FALSE))

  }


  if("word" %in% outputs) {


    if(is.null(output_dir)) {

      file_location <- paste0(file_name,".docx")
    } else { # assuming an output directory is specified

      file_location <- paste0(output_dir,"/",file_name,".docx")


    }

  rmarkdown::render(input = file,
                    output_file = file_location,
                    bookdown::word_document2(reference_docx = stevetemplates::templ_word(),
                                             toc = FALSE, number_sections = FALSE))
  }

  if ("html" %in% outputs) {

    if(is.null(output_dir)) {

      file_location <- paste0(file_name,".html")
    } else { # assuming an output directory is specified

      file_location <- paste0(output_dir,"/",file_name,".html")


    }

  rmarkdown::render(input = file,
                    output_file = file_location,
                    bookdown::html_document2(template = stevetemplates::templ_html_article(),
                                             toc = FALSE, number_sections = FALSE))

  }

}

