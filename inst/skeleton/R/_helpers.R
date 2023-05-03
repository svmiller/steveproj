check_load <- function(func_formals) {

  aaa <- as.character(func_formals)

  if(all(aaa %in% ls(envir = .GlobalEnv))) {

    print("All formal arguments (i.e. data objects) present and accounted for.")

  } else {

    print("Conditionally loading formal arguments (i.e. data objects).")

    files <- paste0("data/",aaa, ".rds")

    for (i in aaa) {

      filepath <- file.path(paste0("data/",i,".rds"))
      assign(i, readRDS(filepath), envir = .GlobalEnv)

    }
  }

}



