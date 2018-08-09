library(here)
library(dplyr)
library(readr)
library(stringr)
library(tidyr)

## Input path ------------------------------------------------------
transcripts_in_path = here("data/processed/childes/sachs_filtered-transcripts.csv")
utterances_in_path = here("data/raw/childes/sachs_utterances.csv")
## -----------------------------------------------------------------

## Output path -----------------------------------------------------
out_path = here("data/processed/childes/sachs_filtered-utterances.csv")
## -----------------------------------------------------------------

# Read in filtered transcripts and raw utterances
filtered_transcripts <- read_csv(transcripts_in_path)
raw_utterances <- read_csv(utterances_in_path)


# Some light reorganization
raw_utterances <- raw_utterances %>% 
  select(-id, -speaker_id, -utterance_order, -corpus_id,
         -num_tokens, -stem, -part_of_speech, -speaker_code,
         -speaker_name, -speaker_role, -target_child_id, 
         -type, -media_end, -media_start, -media_unit,
         -collection_id, -num_morphemes, -language) %>% 
  rename(utterance = gloss, age = target_child_age,
         child = target_child_name, sex = target_child_sex,
         collection = collection_name, corpus = corpus_name) %>% 
  select(db_version, collection, corpus, child, sex, age,
         utterance, transcript_id) %>% 
  drop_na(utterance)


# Filtering out non-matches 
filtered_utterances <- raw_utterances %>% 
  inner_join(filtered_transcripts)


# Some more reorganizing
filtered_utterances <- filtered_utterances %>% 
  select(-transcript_id) %>% 
  select(-utterance, everything()) %>% # moving utterance to far right
  arrange(age)



# Writing output file
write.csv(filtered_utterances, out_path, row.names = FALSE)
