the_output <- "latex"

rmarkdown::render("ms.Rmd", output_file="doc/ms-anon.pdf", 
                  params=list(anonymous=TRUE,doublespacing=TRUE), 
                  rmarkdown::pdf_document(template = stevetemplates::templ_article2(), 
                                          latex_engine = "xelatex", dev= "cairo_pdf"))