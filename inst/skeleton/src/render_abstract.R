library(rmarkdown)
library(ymlthis)
library(magrittr)

YAML <- yaml_front_matter("ms.Rmd")

YAML[names(YAML) %in% c("title","author","abstract","keywords","geometry","mainfont")] %>%
  as_yml() -> A

A %>%
  yml_rticles_opts(header_includes = "\\pagenumbering{gobble}") -> A


tmp <- use_index_rmd(.yml = A, path = "doc", open_doc = FALSE)

render(tmp,
       output_file="abstract.pdf",
       rmarkdown::pdf_document(template = stevetemplates::templ_article2(),
                                          latex_engine = "xelatex", dev="cairo_pdf"))
file.remove(tmp)
