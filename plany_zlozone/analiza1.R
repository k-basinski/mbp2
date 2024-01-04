library(dplyr)
library(ggplot2)
library(readr)
dane <- read_csv("dane.csv")

dane

# Hipoteza 1:
# Łatwe zadania będą wykonywane lepiej niż trudne.
# Innymi słowy:
# Efekt główny trudności zadania.

dane %>% 
  group_by(trudnosc) %>% 
  summarise(M = mean(pamiec), SD = sd(pamiec))

ggplot(data = dane, mapping = aes(x = trudnosc, y = pamiec)) +
  geom_boxplot() + 
  geom_jitter(alpha = .3)


# Hipoteza 2:
# Pamięć działa wydajniej przy wysokim pobudzeniu 
# emocjonalnym (w porównaniu do niskiego).
# Innymi słowy:
# Efekt główny pobudzenia.

dane %>% 
  group_by(pobudzenie) %>% 
  summarise(M = mean(pamiec), SD = sd(pamiec))

ggplot(data = dane, mapping = aes(x = pobudzenie, y = pamiec)) +
  geom_boxplot() + 
  geom_jitter(alpha = .3)


# Hipoteza 3:
# # Pamięć działa wydajniej przy wysokim pobudzeniu 
# emocjonalnym ale tylko dla trudnych zadań. Dla
# łatwych efekt jest słabszy.
# Innymi słowy:
# Na pamięć wpływa interakcja pobudzenia i trudności.

dane %>% 
  group_by(pobudzenie, trudnosc) %>% 
  summarise(M = mean(pamiec), SD = sd(pamiec))

ggplot(data = dane, mapping = aes(
  x = pobudzenie, 
  y = pamiec,
  color = trudnosc
  )) +
  geom_boxplot() + 
  geom_jitter(alpha = .5)


# Efekty proste:
# 1. (jest istostny) Efekt prosty trudności zadania przy niskim pobudzeniu.
# 2. (jest istostny) Efekt prosty trudności zadania przy wysokim pobudzeniu.
# 3. (jest istostny) Efekt prosty pobudzenia dla trudnych zadań.
# 4. Brak (?) efektu prostego pobudzenia dla łatwych zadań.

# ANOVA (analiza wariancji) dwuczynnikowa dla grup niezależnych
# UWAGA: to działa dla grup niezależnych i równolicznych warunków eksp.

anova_res <- aov(pamiec ~ pobudzenie + trudnosc + pobudzenie:trudnosc, data = dane) 
summary(anova_res)

# post-hoc comparisons with Tukey HSD
TukeyHSD(anova_res)
