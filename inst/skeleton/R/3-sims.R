prep <- function() {
  set.seed(8675309)
  ESS9GB %>%
    mutate(noise = rnorm(nrow(.))) -> Data

  saveRDS(Data, "data/Data.rds")
  Data <<- Data
  return(Data)
}


analysis <- function() {
  Data <- readRDS("data/Data.rds")
  Mods <- list()
  Mods[[1]] <- lm(immigsent ~ agea + female + eduyrs + uempla + hinctnta + lrscale, data=Data)
  Mods[[2]] <- lm(immigsent ~ agea + female + eduyrs + uempla + hinctnta + lrscale + noise, data=Data)
  saveRDS(Mods, "data/Mods.rds")
  Mods <<- Mods
  return(Mods)

}

sims <- function() {


  Mods <- readRDS("data/Mods.rds")
  Data <- readRDS("data/Data.rds")

  Data %>%
    data_grid(lrscale = unique(lrscale), .model = Mods[[1]],
              immigsent = 0) %>% na.omit -> newdat


  Sims <- list()

  newdat %>%
    # repeat this data frame how many times we did simulations
    dplyr::slice(rep(row_number(), 1000)) %>%
    bind_cols(get_sims(Mods[[1]], newdata = newdat, 1000, 8675309), .) -> Sims$"SQI (Ideology)"


  saveRDS(Sims, "data/Sims.rds")
  Sims <<- Sims
  return(Sims)
}
