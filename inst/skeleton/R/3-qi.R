qi <- function(data = Data, mods = Mods) {

  check_load(formals())

  Data %>%
    data_grid(lrscale = unique(lrscale), .model = Mods[[1]],
              immigsent = 0) %>% na.omit -> newdat


  QI <- list()

  newdat %>%
    # repeat this data frame how many times we did simulations
    dplyr::slice(rep(row_number(), 1000)) %>%
    bind_cols(get_sims(Mods[[1]], newdata = newdat,
                       1000, 8675309), .) -> QI$"SQI (Ideology)"

  saveRDS(QI, "data/QI.rds")
  QI <<- QI
  return(QI)
}
