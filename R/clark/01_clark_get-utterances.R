library(here)
library(dplyr)
library(childesr)


## Output path -----------------------------------------------------
out_path = here("data/raw/clark_utterances.csv")
## -----------------------------------------------------------------

# Getting all utterances from childesr
utterances <- get_utterances(collection = 'Eng-NA',
                             corpus = 'Clark',
                             role = 'Target_Child')

# The database version used
version <- get_database_version()

# Adding database version info to dataframe
utterances <- utterances %>% 
  mutate(db_version = version)

# Write output file
write.csv(utterances, out_path, row.names = FALSE)

