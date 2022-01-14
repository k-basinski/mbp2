library(tidyverse)

nazwy_plikow <- Sys.glob("data/*.csv")
wyniki <- tibble()
for(plik in nazwy_plikow){
  sniezynka <- read_csv(plik)  
  gwiazdeczka <- sniezynka %>% select(menu, slider.response, participant) %>% drop_na()
  wyniki <- bind_rows(wyniki, gwiazdeczka)
}
wyniki
