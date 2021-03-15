# Libraries first
library(stevemisc)
library(tidyverse)
library(modelr)

# Load stuff
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
