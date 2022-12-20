# To jest bardziej "okrągłe" rozwiązanie zadania, dla wszystkich, którym nie działa rozwiązanie pierwsze.

library(tidyverse)

lista_plikow <- list.files("csv")
lista_plikow <- paste("csv", lista_plikow, sep="/")

wynik <- data.frame()
for (l in lista_plikow) {
  df <- read_csv(l)
  maly_wynik <- df %>% 
    select(participant, key_resp.rt)
  wynik <- rbind(wynik, maly_wynik)
}
wynik
write_csv(wynik, "data.csv")

