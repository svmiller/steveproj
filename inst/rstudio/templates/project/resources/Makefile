# Specify a vew variables to avoid repitition downstream

OUTPUTS=doc/ms.pdf doc/ms-anon.pdf doc/ms.docx
RDS= data/Sims.rds data/Mods.rds data/Data.rds

# Specify the primary targets: the outputs
# Also have a clean option for testing

all: $(OUTPUTS)
refs: inst/refs.bib

clean:
	rm -f $(OUTPUTS) $(RDS)

# Specialty sourcing for each output

doc/ms.pdf:	ms.Rmd $(RDS)
	Rscript -e 'source("src/render_pdf.R")'

doc/ms-anon.pdf: ms.Rmd $(RDS)
	Rscript -e 'source("src/render_pdf-anon.R")'

doc/ms.docx: ms.Rmd $(RDS)
	Rscript -e 'source("src/render_docx.R")'

inst/refs.bib: ms.Rmd
	Rscript -e 'source("src/get_citations.R")'

# Specify what to do for each target .rds

data/Sims.rds: data/Mods.rds R/3-sims.R
	Rscript -e 'source("R/3-sims.R")'

data/Mods.rds: data/Data.rds R/2-analysis.R
	Rscript -e 'source("R/2-analysis.R")'

data/Data.rds: R/1-prep.R
	Rscript -e 'source("R/1-prep.R")'
