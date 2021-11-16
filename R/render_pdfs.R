#' Render PDFs
#'
#' @description dsfasdfasfda
#'
#'
#' @param ... optional stuff, but you can ignore this, for now
#'
#' @return dsafsdafsa
#'
#' @examples
#'
#' \dontrun{
#' render_pdf()
#' }
#'
#' @export
#'

render_pdfs <- function(...) {

  rmarkdown::render("ms.Rmd",
                    output_file="doc/ms.pdf",
                    bookdown::pdf_document2(template = stevetemplates::templ_article2(),
                                            latex_engine = "xelatex", dev="cairo_pdf", toc = FALSE,
                                            number_sections = FALSE))

  rmarkdown::render("ms.Rmd", output_file="doc/ms-anon.pdf",
                    params=list(anonymous=TRUE,doublespacing=TRUE,removetitleabstract=TRUE),
                    bookdown::pdf_document2(template = stevetemplates::templ_article2(),
                                            latex_engine = "xelatex", dev= "cairo_pdf", toc = FALSE,
                                            number_sections = FALSE))

}
