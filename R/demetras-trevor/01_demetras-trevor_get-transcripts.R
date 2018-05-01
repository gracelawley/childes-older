library(here)
library(dplyr)
library(childesr)


## Output path -----------------------------------------------------
out_path = here("data/raw/demetras-trevor/demetras-trevor_transcripts.csv")
## -----------------------------------------------------------------

# Get transcript names
transcripts <- get_transcripts(collection = 'Eng-NA',
                               corpus = 'Demetras1')

# The database version used
version <- get_database_version()

# Adding database version info to dataframe
transcripts <- transcripts %>% 
  mutate(db_version = version)

# Selecting only needed columns=
transcripts <- transcripts %>% 
  select(db_version, collection = collection_name,
         corpus = corpus_name, target_child = target_child_name,
         target_child_id, sex = target_child_sex, 
         age = target_child_age, date, 
         file = filename, transcript_id)

# Write output file
write.csv(transcripts, out_path, row.names = FALSE)