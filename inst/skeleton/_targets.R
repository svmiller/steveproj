library(targets)
source("R/1-prep.R")
source("R/2-analysis.R")
source("R/3-sims.R")
source("R/_render.R")
tar_option_set(packages = c("stevedata", "tidyverse", "modelr", "stevemisc"))
list(
  tar_target(Data, prep()),
  tar_target(Mods, {
    Data
    analysis()
    }),
  tar_target(Sims, {
    Mods
    Data
    sims()
  }),
  tar_target(ms_rmd, "ms.Rmd", format = "file"),
  tar_target(ms_yaml, "ms.yaml", format = "file"),
  tar_target(docs, {Data
    Mods
    Sims
    ms_rmd
    ms_yaml
    render_pdf()
    render_pdfanon()
    render_docx()
    })
)
