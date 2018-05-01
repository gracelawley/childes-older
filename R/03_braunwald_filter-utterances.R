library(here)
library(dplyr)
library(readr)
library(stringr)

## Input path ------------------------------------------------------
transcripts_in_path = here("data/processed/braunwald_filtered-transcripts.csv")
utterances_in_path = here("data/raw/braunwald_raw-utterances.csv")
## -----------------------------------------------------------------

## Output path -----------------------------------------------------
out_path = here("data/processed/braunwald_filtered-utterances.csv")
## -----------------------------------------------------------------

# Read in filtered transcripts and raw utterances
filtered_transcripts <- read_csv(transcripts_in_path)
raw_utterances <- read_csv(utterances_in_path)

# Prepare filtered_transcripts for join
filtered_transcripts <- filtered_transcripts %>% 
  select(transcript_id, date)

# Filter join
filtered_utterances <- raw_utterances %>% 
  inner_join(filtered_transcripts, by = 'transcript_id') %>% 
  arrange(age)

# Some light reorganization
filtered_utterances <- filtered_utterances %>% 
  filter(!is.na(utterance)) %>%   #dropping NA utterances
  select(db_version, collection, corpus, speaker_role,
         child, sex, age, transcript_id, date, utterance)

# Writing output file
write.csv(filtered_utterances, out_path, row.names = FALSE)



