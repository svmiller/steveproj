render_pdf <- function() {

  ymlchars <- file.info("ms.yaml")$size
  rmdchars <- file.info("ms.Rmd")$size

  cat(paste0(readChar("ms.yaml",nchars=ymlchars),
             readChar("ms.Rmd",nchars=rmdchars)),
      file="tmp.Rmd")

  the_output <- "latex"

  rmarkdown::render("tmp.Rmd",
                    output_file="doc/ms.pdf",
                    bookdown::pdf_document2(template = stevetemplates::templ_article2(),
                                            latex_engine = "xelatex", dev="cairo_pdf", toc = FALSE,
                                            number_sections = FALSE))

  delfiles <- dir(pattern="tmp|fff|log|ttt")
  file.remove(delfiles)
}

render_pdfanon <- function() {

  ymlchars <- file.info("ms.yaml")$size
  rmdchars <- file.info("ms.Rmd")$size

  cat(paste0(readChar("ms.yaml",nchars=ymlchars),
             readChar("ms.Rmd",nchars=rmdchars)),
      file="tmp.Rmd")

  the_output <- "latex"

  rmarkdown::render("tmp.Rmd",
                    output_file="doc/ms-anon.pdf",
                    params=list(anonymous=TRUE,doublespacing=TRUE,removetitleabstract=TRUE),
                    bookdown::pdf_document2(template = stevetemplates::templ_article2(),
                                            latex_engine = "xelatex", dev="cairo_pdf", toc = FALSE,
                                            number_sections = FALSE))

  delfiles <- dir(pattern="tmp|fff|log|ttt")
  file.remove(delfiles)
}


render_docx <- function() {

  ymlchars <- file.info("ms.yaml")$size
  rmdchars <- file.info("ms.Rmd")$size

  cat(paste0(readChar("ms.yaml",nchars=ymlchars),
             readChar("ms.Rmd",nchars=rmdchars)),
      file="tmp.Rmd")

  the_output <- "word"

  rmarkdown::render("tmp.Rmd", output_file="doc/ms.docx",
                    rmarkdown::word_document(reference_docx = stevetemplates::templ_word()))

  delfiles <- dir(pattern="tmp|fff|log|ttt")
  file.remove(delfiles)
}
