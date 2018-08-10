library(here)
library(readr)
library(dplyr)


# Inpaths ---------------------------------------------------------------------
cmu_in_path <- here('data/processed/ref-corpora/cmu-dict-0.7b_types.csv')
childes_in_path <- here("data/processed/childes/all_overall_types.csv")
corpora_in_path <- here("data/processed/childes/all_corpus_types.csv")
# -----------------------------------------------------------------------------

cmu <- read_csv(cmu_in_path)
childes <- read_csv(childes_in_path)
corpora <- read_csv(corpora_in_path)


corpora <- corpora %>% 
  mutate(cmu = ifelse(word %in% cmu$word,
                      1, 0))
