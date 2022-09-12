analysis <- function() {
  Data <- readRDS("data/Data.rds")
  Mods <- list()
  Mods[[1]] <- lm(immigsent ~ agea + female + eduyrs + uempla + hinctnta + lrscale, data=Data)
  Mods[[2]] <- lm(immigsent ~ agea + female + eduyrs + uempla + hinctnta + lrscale + noise, data=Data)
  saveRDS(Mods, "data/Mods.rds")
  Mods <<- Mods
  return(Mods)

}
