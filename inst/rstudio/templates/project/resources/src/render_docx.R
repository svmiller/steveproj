the_output <- "word"

rmarkdown::render("ms.Rmd", output_file="doc/ms.docx", rmarkdown::word_document(reference_docx = stevetemplates::templ_word()))