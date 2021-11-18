#' Render Your R Markdown Appendix to Various Outputs
#'
#' @description `render_appendix()` takes various arguments, most effectively built
#' into the function, and renders your R Markdown manuscript to various outputs
#' supported by \pkg{stevetemplates}.
#'
#'
#' @param file the name of the R Markdown file containing that is your
#' appendix. Defaults to "appendix.Rmd".
#' @param output_dir the output directory to contain the formatted manuscript.
#' Defaults to "doc". Optimally, this is a subdirectory of the directory
#' containing the manuscript. A user who wants the formatted manuscript
#' to be in the same directory as the R Markdown file should specify
#' `output_dir = NULL` here.
#' @param outputs the various formatted manuscript types the user wants,
#' supplied as a character vector. Must be one or more of "pdf", "pdf-anon",
#' "word", and/or "html". No other formats are supported right now. Defaults
#' are "pdf" and "pdf-anon".
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
#' render_appendix()
#' }
#'
#' @export
#'

render_appendix <- function(file = "appendix.Rmd", output_dir = "doc",
                      outputs = c("pdf", "pdf-anon"),
                      parameters, latex_engine = "xelatex",  dev = "cairo_pdf") {

  if (!all(outputs %in% c("pdf", "pdf-anon", "word", "html"))) {
    stop("Invalid outputs are specified. Valid entries here are limited to 'pdf', 'pdf-anon', 'word', and 'html'")
  }

  if(pandoc_available() == FALSE) {
    stop("R can't find a version of pandoc to use. RStudio has a version of pandoc built into it, but using the original command line interface may lead to an issue like this. Solving this will depend on your particular set up. This solution on Stack Overflow may point to a potential workaround, certainly if you have RStudio installed: https://stackoverflow.com/questions/35624025/pandoc-from-rsudio-server-not-recognized-when-running-script-via-cron")
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

  render(input = file,
                    output_file = file_location,
                    pdf_document2(template = templ_article2(),
                                            latex_engine = "xelatex", dev="cairo_pdf", toc = FALSE,
                                            number_sections = FALSE))

  }

  if("pdf-anon" %in% outputs) {

    if(is.null(output_dir)) {

      file_location <- paste0(file_name,".pdf")
    } else { # assuming an output directory is specified

      file_location <- paste0(output_dir,"/",file_name,".pdf")


    }

  render(input = file,
                    output_file = file_location,
                    params=the_params,
                    pdf_document2(template = templ_article2(),
                                            latex_engine = "xelatex", dev= "cairo_pdf", toc = FALSE,
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

  if ("html" %in% outputs) {

    if(is.null(output_dir)) {

      file_location <- paste0(file_name,".html")
    } else { # assuming an output directory is specified

      file_location <- paste0(output_dir,"/",file_name,".html")


    }

  render(input = file,
                    output_file = file_location,
                    html_document2(template = templ_html_article(),
                                             toc = FALSE, number_sections = FALSE))

  }

}

