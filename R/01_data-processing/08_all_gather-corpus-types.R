library(here)
library(readr)
library(dplyr)

## Input path ------------------------------------------------------
in_path = here("data/processed/all_corpus_tokens.csv")
## -----------------------------------------------------------------

## Output path -----------------------------------------------------
out_path = here("data/processed/all_corpus_types.csv")
## -----------------------------------------------------------------

# Importing data
all_tokens <- read_csv(in_path)


# Some light reorganization
all_types <- all_tokens %>% 
  select(-child, -sex, -age,
         -filename, -date)



# Calculating count per type by individual corpora
all_types <- all_types %>% 
  group_by(corpus, word) %>% 
  mutate(n_corpus = n())

# Calculating overall count per type
all_types <- all_types %>% 
  group_by(word) %>% 
  mutate(n_overall = n())



# Some more reorganization
all_types <- all_types %>% 
  distinct()

all_types <- all_types %>% 
  arrange(desc(n_overall), desc(n_corpus))




# Writing output file
write.csv(all_types, out_path, row.names = FALSE)