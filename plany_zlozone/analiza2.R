library(tidyverse)

df <- read_csv("dane1.csv")


df %>% 
  group_by(pobudzenie, walencja) %>% 
  summarize(M = mean(wynik), SD = sd(wynik))

ggplot(df, aes(x = pobudzenie, y = wynik, color = walencja)) +
  geom_boxplot() + 
  geom_jitter(width = .5, alpha = .5)

aov(wynik ~ pobudzenie + walencja + pobudzenie:walencja, data = df) %>% 
  summary()

# efekt prosty walencji przy niskim pobudzeniu
# efekt prosty walencji przy wysokim pobudzeniu
# brak efektu prostego pobudzenia przy negatywnej walencji
# brak efektu prostego pobudzenia przy pozytywnej walencji

# istotny efekt główny walencji
# brak efektu głównego pobudzenia
# brak efektu interakcji




df2 <- read_csv("dane2.csv")


df2 %>% 
  group_by(pobudzenie, walencja) %>% 
  summarize(M = mean(wynik), SD = sd(wynik))


ggplot(df2, aes(x = pobudzenie, y = wynik, color = walencja)) +
  geom_boxplot() + 
  geom_jitter(width = .1, alpha = .5)

aov(wynik ~ pobudzenie + walencja + pobudzenie:walencja, data = df2) %>% 
  summary()

# efekt prosty pobudzenia przy pozytywnej walencji
# efekt prosty pobudzenia przy negatywnej walencji
# brak efektu prostego walencji przy niskim pobudzeniu
# brak efektu prostego walencji przy wysokim pobudzeniu
# efekt główny pobudzenia
# brak efektu głównego walencji
# 

df3 <- read_csv("dane3.csv")


df3 %>% 
  group_by(pobudzenie, walencja) %>% 
  summarize(M = mean(wynik), SD = sd(wynik))


ggplot(df3, aes(x = pobudzenie, y = wynik, color = walencja)) +
  geom_boxplot()

ggplot(df3, aes(x = pobudzenie, y = wynik)) +
  geom_boxplot() + 
  geom_jitter(width = .1, alpha = .5)

ggplot(df3, aes(x = walencja, y = wynik)) +
  geom_boxplot() + 
  geom_jitter(width = .1, alpha = .5)

aov(wynik ~ pobudzenie + walencja + pobudzenie:walencja, data = df3) %>% 
  summary()

# efekt główny pobudzenia
# efekt główny walencji
# efekt interakcji pobudzenia i walencji


df4 <- read_csv("dane4.csv")


df4 %>% 
  group_by(pobudzenie, walencja) %>% 
  summarize(M = mean(wynik), SD = sd(wynik))


ggplot(df4, aes(x = pobudzenie, y = wynik, color = walencja)) +
  geom_boxplot()

ggplot(df4, aes(x = pobudzenie, y = wynik)) +
  geom_boxplot() + 
  geom_jitter(width = .1, alpha = .5)

ggplot(df4, aes(x = walencja, y = wynik)) +
  geom_boxplot() + 
  geom_jitter(width = .1, alpha = .5)

aov(wynik ~ pobudzenie + walencja + pobudzenie:walencja, data = df4) %>% 
  summary()

# Istotny efekt prosty walencji dla niskiego pobudzenia
# Istotny efekt prosty walencji dla wysokiego pobudzenia
# Brak efektu prostego pobudzenia dla pozytywnej walencji
# Brak efektu prostego pobudzenia dla negatywnej walencji
# Istotny efekt główny walencji
# Nieistotny efekt główny pobudzenia
# Nieistotny efekt interakcji

df5 <- read_csv("dane5.csv")


df5 %>% 
  group_by(pobudzenie, walencja) %>% 
  summarize(M = mean(wynik), SD = sd(wynik))


ggplot(df5, aes(x = pobudzenie, y = wynik, color = walencja)) +
  geom_boxplot()

ggplot(df5, aes(x = pobudzenie, y = wynik)) +
  geom_boxplot() + 
  geom_jitter(width = .1, alpha = .5)

ggplot(df5, aes(x = walencja, y = wynik)) +
  geom_boxplot() + 
  geom_jitter(width = .1, alpha = .5)

aov(wynik ~ pobudzenie + walencja + pobudzenie:walencja, data = df5) %>% 
  summary()

# Efekt prosty walencji przy niskim pobudzeniu
# Brak efektu prostego walencji przy wysokim pobudzeniu
# Efekt prosty pobudzenia przy pozytywnej walencji
# Efekt prosty pobudzenia przy negatywnej
# Brak efektu głównego pobudzenia
# Efekt główny walencji
# istotny efekt interakcji

df6 <- read_csv("dane6.csv")


df6 %>% 
  group_by(pobudzenie, walencja) %>% 
  summarize(M = mean(wynik), SD = sd(wynik))


ggplot(df6, aes(x = pobudzenie, y = wynik, color = walencja)) +
  geom_boxplot()

ggplot(df6, aes(x = pobudzenie, y = wynik)) +
  geom_boxplot() + 
  geom_jitter(width = .1, alpha = .5)

ggplot(df6, aes(x = walencja, y = wynik)) +
  geom_boxplot() + 
  geom_jitter(width = .1, alpha = .5)

# Efekt prosty walencji przy niskim pobudzeniu
# Efekt prosty walencji przy wysokim pobudzeniu
# Efekt prosty pobudzenia przy negatywnej walencji
# Efekt prosty pobudzenia przy pozytywnej walencji
# Brak efektu głównego pobudzenia
# Brak efektu głównego walencji
# Istotny efekt interakcji

aov(wynik ~ pobudzenie + walencja + pobudzenie:walencja, data = df6) %>% 
  summary()
