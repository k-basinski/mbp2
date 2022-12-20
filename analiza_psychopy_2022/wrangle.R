# Weź wszystkie wynikowe CSVki i zrób z nich 
# jeden, tidy plik CSV.

library(tidyverse)

# znajdź nazwy wszystkich plików w folderze 'csv'
lista_plikow <- list.files("csv")

# doklej do każdej nazwy pliku napis: "csv/"
lista_plikow <- paste("csv", lista_plikow, sep = "/")

# otwórz wszystkie CSVki jako Tibble (data frames)
df <- read_csv(lista_plikow)

# z df wyciągnij kolumny 'key_resp.rt' (czas reakcji)
# oraz 'participant' (osoba badana)
wynik <- df %>% 
  select(participant, key_resp.rt, key_resp.keys)

# zapisz wynik w pliku "dane.csv"
write_csv(wynik, "dane.csv")

# na marginesie:
# jeśli chcemy sprawdzić poprawność odpowiedzi, można
# na przykład zrobić to tak:
wynik <- wynik %>% 
  mutate(poprawna = if_else(key_resp.keys == "space", TRUE, FALSE))


# WUJEK GUGLE:
# "R list files in folder"

# https://stat.ethz.ch

# stackoverflow.com



