# start radiant
# shiny::runApp(system.file('marketing', package='radiant'))

inst_repo <- function() {
# install to user directory
local_dir <- Sys.getenv("R_LIBS_USER")
if(!file.exists(local_dir)) dir.create(local_dir, recursive = TRUE)

# setting the url for the miniCRAN, using XRAN as in yihui/xran :)
# options(repos = c(XRAN="http://mostly-harmless.github.io/radiant_miniCRAN/", CRAN="http://cran.rstudio.com"))
options(repos = c(XRAN = "http://mostly-harmless.github.io/radiant_miniCRAN/"))

# udpate old-packages
update.packages(lib.loc = local_dir, ask = FALSE)

# install packages that are available but were not installed before
to_inp <- new.packages(lib.loc = local_dir)
if(length(to_inp) != 0)
	install.packages(to_inp, local_dir)
}

# inst_repo()

dep_list <- function() {

	# get list of packages()
	devtools::source_url("https://raw.githubusercontent.com/mostly-harmless/radiant_miniCRAN/gh-pages/pkgs.R")

	# setwd("~/Desktop/GitHub/radiant_dev")
	# for(i in pkgs)
	# 	devtools::use_package(i)

	library(magrittr)
	cat("Depends:\n")
	cat(paste0("\t",pkgs[1],"(>=",packageVersion(i),")"))
	for(i in pkgs[-1])
		cat(paste0(",\n\t",i,"(>=",packageVersion(i),")"))

}

# dep_list()
