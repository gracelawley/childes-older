library(here)
library(dplyr)
library(childesr)


## Output path -----------------------------------------------------
out_path = here("data/raw/hall/hall_utterances.csv")
## -----------------------------------------------------------------

# Getting all utterances from childesr
utterances <- get_utterances(collection = 'Eng-NA',
                             corpus = 'Hall',
                             role = 'Target_Child')

# The database version used
version <- get_database_version()

# Adding database version info to dataframe
utterances <- utterances %>% 
  mutate(db_version = version)

# Selecting only needed columns
utterances <- utterances %>% 
  select(db_version, collection = collection_name,
         corpus = corpus_name, speaker_role, speaker_name,
         speaker_id, target_child_name, target_child_id,
         target_child_sex, target_child_age, 
         utterance = gloss, transcript_id)

# Write output file
write.csv(utterances, out_path, row.names = FALSE)

