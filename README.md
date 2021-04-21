
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
documents (`src/`), R scripts for analysis (`R/`), finished data objects
(`data/`), and finished reports (`doc/`). An accompanying `Makefile` and
R Markdown file will assist in the management and production of the
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

When the time comes, you can install this on CRAN. Any version of this
package on CRAN should be understood as a “stable” release that may lag
behind the “development” versions available on Github. However, releases
on CRAN should come with more confidence about quality control.

``` r
install.packages("steveproj")
```

A developmental version version of `{steveproj}` is available on Github
and you can install it via the `{devtools}` package. I suppose using the
`{remotes}` package would work as well.

``` r
devtools::install_github("svmiller/steveproj")
```

### A Comment on LaTeX, Make, and Rstudio

The functions in this package work as intended in an R console, but this
package realizes its full potential and its core functions are fully
augmented through three additional pieces of software the user should
already have installed. The first is [Rstudio](https://www.rstudio.com).
Most dedicated R users are likely fully aware of Rstudio as an
integrated desktop environment (IDE) and already have it installed and
pre-configured to what they think is ideal for their workflow. I will
only add that I think it advantageous for the sake of this package to
adjust the pane layout such that the “source” pane is top left, the
“console” pane is top right, the “environment” pane is bottom left, and
the “files” pane is bottom right.

The second piece of software is [LaTeX](https://www.latex-project.org).
LaTeX is a prominent document preparation system in academia and
preferred by publishers especially for its contrast to “What You See Is
What You Get” word processors like Microsoft Word. `{steveproj}`
ultimately places R Markdown and Pandoc—which are necessary for this
package—before LaTeX in terms of document preparation. No matter,
`{steveproj}` necessarily elevates LaTeX PDF documents above other
output types. Interested users with no awareness of LaTeX should know
`{steveproj}` imports `{rmarkdown}`, which in turn imports `{tinytex}`.
This would install and maintain a version of LaTeX to compile these
documents. However, the particular flavor of LaTeX template (from
`{stevetemplates}`) requires one additional LaTeX dependency that
`{tinytex}` does not install by default. You may encounter a vague error
in rendering to PDF that reads something like this.

> ! Undefined control sequence. l.40 {same} % disable monospaced font
> for URLs

If you encounter this error, run the following command in your R
console.

``` r
tinytex::tlmgr_install("xurl")
```

[This should fix
it](https://github.com/svmiller/stevetemplates/issues/1). I thank Ian
Adams for bringing this to my attention (and Cornelius Hennch for
proposing a solution).

The third piece of software the user should install is
[Make](https://en.wikipedia.org/wiki/Make_(software)). Make is a build
automation tool built around a “Makefile”, which contains a set of
recipes that have various targets and dependencies. For each target, if
the specified dependency is “newer” than the target (or if the target
does not yet exist), the Makefile executes a command. Users will get a
reproducible example of how this works, and they can learn by example
from it, but it assumes the user already has it installed.

Installation of Make prior to installation of `{steveproj}` is not
necessary; in fact, it’s not even strictly necessary to have Make
installed at all. It is, however, strongly encouraged. Linux users and
Mac users should, in theory, have Make installed on their operating
systems already (i.e. because both are UNIX-derivative and Make is a GNU
program). Opening a terminal and entering the following command should
confirm that.

``` make
make -v
```

If the console output instead suggests Make is not installed, the user
may want to search for how they can install it (given their particular
flavor of Mac or Linux). For Mac users, most paths would lead to
[installing or updating Xcode from the App
Store](https://stackoverflow.com/questions/10265742/how-to-install-make-and-gcc-on-a-mac)
through the popular [`Homebrew` package manager](https://brew.sh) should
also do this. Linux users in the Debian family (prominently: Ubuntu)
who, for some reason, don’t already have this installed can install it
via `sudo apt-get install build-essential` or
`sudo apt-get -y install make` in a console. Linux users in the Red Hat
family (prominently: Fedora) should be able to install it by way of
`sudo yum install yum-utils` or `dnf install @development-tools`.
However, it seems impossible that these would not already be installed
on most Linux distributions these days. No matter, `make -v` should
confirm its presence after one of these installation paths.

Windows users will invariably have to install it since it will not come
by default. [*The Carpentries* has a
guide](https://swcarpentry.github.io/make-novice/setup) and installer to
do this. Windows users may also want to [consider installing
`Chocolately`](https://chocolatey.org), an apparent `Homebrew` analog
for Windows users. Afterward, a simple `choco install make` command
should work just fine. The increased integration of Linux into Windows,
prominently [Windows Subsystem for
Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10),
offers more avenues for Windows users to install Make on their operating
system.

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
