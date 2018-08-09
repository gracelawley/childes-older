library(here)
library(dplyr)
library(readr)
library(stringr)
library(childesr)
library(tidyr)
library(purrr)
library(tidytext)
library(knitr)
library(kableExtra)


corpora <- rbind(c('Eng-NA', 'Bloom70'), 
                c('Eng-NA', 'Braunwald'), 
                c('Eng-NA', 'Brown'),
                c('Eng-NA', 'Clark'),
                c('Eng-NA', 'Cornell'),
                c('Eng-NA', 'Demetras1'),
                c('Clinical-MOR', 'EllisWeismer'),
                c('Eng-NA', 'Hall'),
                c('Eng-NA', 'Kuczaj'),
                c('Eng-NA', 'MacWhinney'),
                c('Eng-NA', 'Sachs'),
                c('Eng-NA', 'Suppes'),
                c('Eng-NA', 'Warren'),
                c('Eng-NA', 'Weist')) %>% 
  as_data_frame() %>% 
  rename(collection = V1, corpus = V2)

