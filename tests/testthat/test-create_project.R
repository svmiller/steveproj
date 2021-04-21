test_create_project <- function(...) {

  # don't run on CRAN
  # copied from rstudio/rticles, if I'm being honest
  if (!identical(Sys.getenv("NOT_CRAN"), "true")) return()

  # work in a temp directory
  dir <- tempfile()
  dir.create(dir)
  oldwd <- setwd(dir)
  on.exit(setwd(oldwd), add = TRUE)

  steveproj::create_project("testthis")

  #setwd(paste0(oldwd, "/testthis"))
  message(tempdir())

  expect_true(file.exists(paste0(dir,"/testthis/ms.Rmd")))
  expect_true(file.exists(paste0(dir,"/testthis/Makefile")))
  expect_true(file.exists(paste0(dir,"/testthis/README.md")))
  expect_true(file.exists(paste0(dir,"/testthis/_output.yaml")))

  expect_true(dir.exists(paste0(dir,"/testthis/doc")))
  expect_true(dir.exists(paste0(dir,"/testthis/inst")))
  expect_true(dir.exists(paste0(dir,"/testthis/data")))
  expect_true(dir.exists(paste0(dir,"/testthis/src")))
  expect_true(dir.exists(paste0(dir,"/testthis/R")))

  expect_true(file.exists(paste0(dir,"/testthis/src/render_pdf.R")))
  expect_true(file.exists(paste0(dir,"/testthis/src/render_pdf-anon.R")))
  expect_true(file.exists(paste0(dir,"/testthis/src/render_docx.R")))
  expect_true(file.exists(paste0(dir,"/testthis/src/render_abstract.R")))
  expect_true(file.exists(paste0(dir,"/testthis/src/get_citations.R")))

  expect_true(file.exists(paste0(dir,"/testthis/R/1-prep.R")))
  expect_true(file.exists(paste0(dir,"/testthis/R/2-analysis.R")))
  expect_true(file.exists(paste0(dir,"/testthis/R/3-sims.R")))

  system("cd testthis; make data/Sims.rds")



  # # create a draft of the format
  # testdoc <- paste0(templ,".Rmd")
  # rmarkdown::draft(
  #   testdoc, template = templ, package="stevetemplates",
  #   create_dir = FALSE, edit = FALSE
  # )
  # expect_true(file.exists(paste0(templ,".Rmd")))
  # message('Rendering the ', templ, ' format...')
  # output_file <- rmarkdown::render(testdoc, quiet = TRUE)
  # assert(paste(templ, "format works"), {
  #   file.exists(output_file)
  # })
}

test_create_project()
