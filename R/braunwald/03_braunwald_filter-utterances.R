library(here)
library(dplyr)
library(readr)
library(stringr)
library(tidyr)

## Input path ------------------------------------------------------
transcripts_in_path = here("data/processed/braunwald/braunwald_filtered-transcripts.csv")
utterances_in_path = here("data/raw/braunwald/braunwald_utterances.csv")
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

# Filtered join
filtered_utterances <- raw_utterances %>% 
  inner_join(filtered_transcripts, by = 'transcript_id') %>% 
  arrange(target_child_age)

# Some light reorganization
filtered_utterances <- filtered_utterances %>%
  drop_na(utterance) %>%   
  select(-speaker_role, -speaker_name, -speaker_id,
         -target_child_id) %>% 
  rename(child = target_child_name,
         sex = target_child_sex,
         age = target_child_age)
  
# Writing output file
write.csv(filtered_utterances, out_path, row.names = FALSE)



