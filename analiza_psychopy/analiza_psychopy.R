library(tidyverse)

df <- read_csv("analiza_psychopy/data/bulwiaste_data.csv")

df %>% select(key_resp.keys) %>% drop_na()
