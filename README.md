
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

More to come.
