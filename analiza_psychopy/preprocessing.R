# otwórz dane surowe i wrzuć do jednego pliku csv

# importuj tidyverse
library(tidyverse)


# znajdź wszystkie pliki csv w folderze 'data'
nazwy_plikow <- Sys.glob("data/*.csv")

# stwórz pustą tabelę
wyniki <- tibble()

# iteruj po nazwach plików
for (plik in nazwy_plikow) {
  
  # otwórz plik csv
  df <- read_csv(plik)
  
  # wybierz kolumny i wywal NA
  jedna_osoba <- df %>% 
    select(menu, slider.response, participant) %>% 
    drop_na()
  
  # sklej poprzednie wyniki z wynikami tej osoby
  wyniki <- bind_rows(wyniki, jedna_osoba)
}

# zapisz wszystko w 'wyniki.csv'
write_delim(wyniki, "wyniki.csv", delim = ",")
