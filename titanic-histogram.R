options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(dslabs)
library(titanic)




titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))
params <- titanic %>%
  filter(!is.na(Age)) %>%
  summarize(mean = mean(Age), sd = sd(Age))
titanic %>% filter(!is.na(Age)) %>% ggplot() + geom_histogram(aes(Age,fill = Survived), alpha = 0.2)