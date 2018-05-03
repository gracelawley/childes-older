library(here)
library(dplyr)
library(readr)
library(stringr)

## Input path ------------------------------------------------------
in_path = here("data/raw/braunwald/braunwald_transcripts.csv")
## -----------------------------------------------------------------

## Output path -----------------------------------------------------
out_path = here("data/processed/braunwald/braunwald_filtered-transcripts.csv")
## -----------------------------------------------------------------

# Read in raw transcript csv
raw_transcripts <- read_csv(in_path)

# Filtering for matches based on the project criteria
filtered_transcripts <- raw_transcripts %>% 
  filter(target_child_age >= 36.0 & target_child_age <= 96.0,
         str_count(filename, '0diary') == 0) %>% 
  arrange(target_child_age)

# Some light reorganization
filtered_transcripts <- filtered_transcripts %>%
  select(-language, -corpus_id, -collection_id, -pid,
         -target_child_id) %>%
  rename(collection = collection_name, corpus = corpus_name,
         child = target_child_name, sex = target_child_sex,
         age = target_child_age) %>% 
  select(db_version, collection, corpus, child, sex, age,
         transcript_id, filename, date)


# Writing output file
write.csv(filtered_transcripts, out_path, row.names = FALSE)
