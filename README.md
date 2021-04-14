
# Steve’s Academic R Projects

[![](https://www.r-pkg.org/badges/version/steveproj?color=green)](https://cran.r-project.org/package=steveproj)
[![](http://cranlogs.r-pkg.org/badges/grand-total/steveproj?color=green)](https://cran.r-project.org/package=steveproj)
[![](http://cranlogs.r-pkg.org/badges/last-month/steveproj?color=green)](https://cran.r-project.org/package=steveproj)
[![](http://cranlogs.r-pkg.org/badges/last-week/steveproj?color=green)](https://cran.r-project.org/package=steveproj)

<img src="http://svmiller.com/images/steveproj-hexlogo.png" alt="My steveproj hexlogo" align="right" width="200" style="padding: 0 15px; float: right;"/>

`{steveproj}` is an R package to help you start and manage R projects
with an eye toward producing an academic project (to culminate in an
academic paper). The package is in development and will incorporate
other packages in my eponymous R ecosystem, prominently
[`{stevetemplates}`](https://github.com/svmiller/stevetemplates). The
package itself leans primarily on Rstudio and how it creates/manages
projects. The creation a project in Rstudio, through `{steveproj}`, will
result in a new directory containing subdirectories for rendering
documents (`src`), R scripts for analysis (`R`), finished data objects
(`data`), and finished reports (`doc`). An accompanying `Makefile` and R
Markdown file will assist in the management and production of the
project.

## What It Does (So Far)

Assuming the latest/development version of
[`{stevetemplates}`](https://github.com/svmiller/stevetemplates)
(i.e. the one that has the Word template) and considering any potential
LaTeX weirdness that comes from different builds, this package has
function in R and Make that will:

-   simplify the research process to three basic “targets” (in Make): a
    finished data product to analyze, statistical models of the data,
    and post-estimation simulations of quantities of interest from the
    data. These scripts are in the `R/` directory and render to the
    `data/` directory.
-   render your R Markdown document to a fancy PDF document in LaTeX
    using [my second article
    template](http://svmiller.com/blog/2020/09/another-rmarkdown-article-template/).
-   render your R Markdown document to an anonymized version of that
    same document. [A post on my
    blog](http://svmiller.com/blog/2021/03/handle-academic-projects-steveproj-make/)
    gives clues how to do this with YAML parameters.
-   render your R Markdown document to an anonymized Word document.
    Anonymized Word documents are all that I’m willing to support here.
    The goal isn’t to publish to Word, per se; it’s only to produce a
    document suitable for peer review for journals that demand you
    provide one.
-   farm your R Markdown document for citations and format them to a
    bibliography file. By default, this will render to a `refs.bib` file
    in the `inst/` directory. You can tweak this if you like.
-   scan your R Markdown document to render a simple title page for peer
    review. Traditionally, journals ask for a title page (with author
    information) and a manuscript (without author information).
    `render_abstract.R` in the `src/` directory is the companion script
    to `render_pdf-anon.R` in the same directory.

## Installation

When the time comes, you can install this on CRAN.

``` r
install.packages("steveproj")
```

Right now, this package in development and is not available on CRAN. You
can install the development version of `steveproj` from Github via the
`devtools` package. I suppose using the `remotes` package would work as
well.

``` r
devtools::install_github("svmiller/steveproj")
```

## Usage

My website will have a more exhaustive tutorial for using this package
and all that comes in it. For now, a user maximize their experience with
`{steveproj}` through either the console or Rstudio.

### Console

Assume the current working directory is something like
`/home/steve/Dropbox/projects` (as it is for me). Then, a user can
create a new project with the `create_project()` command.

``` r
steveproj::create_project("dissertation")
```

This will create a new directory in the working directory, titled
“dissertation”, that includes a skeleton of a research project to assist
the user in getting started on their academic paper/project. That
directory will be located in the current working directory. The only
downside to the console approach over the Rstudio approach is the
console approach won’t create an `.Rproj` file in the directory. The
Rstudio approach will.

You could optionally combine this command line call in the console with
the following command, which will add an `.Rproj` file to the directory
you just created.

``` r
# steveproj::create_project("dissertation")
# ^ assume you just ran this
# Then, do this next
steveproj::create_rproj("dissertation")
```

### Rstudio

Go to *File &gt; New Project*. You’ll see a prompt that looks like this.
Select “New Directory”.

![](http://svmiller.com/images/github-steveproj/steveproj-1.png)

That will direct you here. Scroll down your available project types
until you see my “S” icon, which is incidentally the favicon on [my
website](http://svmiller.com). Select that entry to create a new
academic paper/project.

![](http://svmiller.com/images/github-steveproj/steveproj-2.png)

That will direct you here. Enter the name of the directory you want to
create. Click “Create Project” when you’re done. This will create a new
directory, titled whatever you entered in the directory name, along with
an `.Rproj` file. By default, it will also open a new Rstudio session.

![](http://svmiller.com/images/github-steveproj/steveproj-3.png)
