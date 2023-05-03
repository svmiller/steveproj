library(targets) # load {targets}
sapply(list.files("R", full.names=TRUE), source) # load everything in R/ dir.
tar_option_set(packages = c("stevedata", "tidyverse", "modelr", "stevemisc"),
               tidy_eval = TRUE)
# ^ declare all packages needed to do my analysis
# Specify workflow below
list(
  tar_target(Data, {
    prep()
    }), # Finished data (Data) depends on prep()
  tar_target(Mods, { # Regression models (Mods) depend on Data, analysis()
    analysis(Data)
    Data
    }),
  tar_target(QI, { # QIs depend on Mods, Data, and qi() function
    Mods
    Data
    qi(Data, Mods)
  }),
  # Next two are flat files (for the documents) and not functions or R objects.
  tar_target(ms_rmd, "ms.Rmd", format = "file"),
  tar_target(ms_yaml, "_config.yaml", format = "file"),
  # Finally: docs is an amalgam of outputs, depending on just about everything.
  tar_target(docs, {Data # if data change, documents should change.
    Mods # if models change, documents should change.
    QI # if QIs change, documents should change
    ms_rmd # if the (R Markdown) document should change, final docs should change
    ms_yaml # if document preamble changes, final docs should change
    render_pdf() # function to create nice, pretty PDF (in {stevetemplates})
    render_pdfanon() # function to create anon. PDF (in {stevetemplates})
    render_docx() # function to create Word doc, just in case.
    })
)
