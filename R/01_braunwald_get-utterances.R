library(here)
library(dplyr)
library(childesr)


## Output path -----------------------------------------------------
out_path = here("data/raw/braunwald_raw-utterances.csv")
## -----------------------------------------------------------------

# Getting all utterances from childesr
utterances <- get_utterances(collection = 'Eng-NA',
                             corpus = 'Braunwald',
                             target_child = 'Laura',
                             role = 'Target_Child')

# The database version used
version <- get_database_version()

# Adding database version info to dataframe
utterances <- utterances %>% 
  mutate(db_version = version)

# Selecting only needed columns
utterances <- utterances %>% 
  select(db_version, collection = collection_name,
         corpus = corpus_name, child = target_child_name,
         sex = target_child_sex, age = target_child_age,
         speaker_role, num_tokens, utterance = gloss,
         transcript_id)

# Write output file
write.csv(utterances, out_path, row.names = FALSE)

