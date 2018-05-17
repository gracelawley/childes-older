library(here)
library(dplyr)
library(childesr)


## Output path -----------------------------------------------------
out_path = here("data/raw/brown_transcripts.csv")
## -----------------------------------------------------------------

# Get transcript names
transcripts <- get_transcripts(collection = 'Eng-NA',
                               corpus = 'Brown')

# The database version used
version <- get_database_version()

# Adding database version info to dataframe
transcripts <- transcripts %>% 
  mutate(db_version = version)

# Write output file
write.csv(transcripts, out_path, row.names = FALSE)