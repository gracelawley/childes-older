library(here)
library(readr)
library(dplyr)

## Input path ------------------------------------------------------
in_path = here("data/processed/childes/all_corpus_tokens.csv")
## -----------------------------------------------------------------

## Output path -----------------------------------------------------
out_path = here("data/processed/childes/all_overall_types.csv")
## -----------------------------------------------------------------

# Importing data
all_tokens <- read_csv(in_path)

# Gathering types
all_types <- all_tokens %>% 
  # some light reorganization
  select(-corpus, -child, -sex,
         -age, -filename, -date) %>% 
  # add overall count
  add_count(word) %>% 
  # isolating the types
  distinct()


# Writing output file
write.csv(all_types, out_path, row.names = FALSE)


