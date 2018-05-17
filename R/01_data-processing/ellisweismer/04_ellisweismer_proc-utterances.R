library(here)
library(dplyr)
library(stringr)
library(readr)
library(tidytext)

## Input path ------------------------------------------------------
in_path = here("data/processed/ellisweismer_filtered-utterances.csv")
## -----------------------------------------------------------------

## Output path -----------------------------------------------------
out_path = here("data/processed/ellisweismer_proc-utterances.csv")
## -----------------------------------------------------------------


# Loading text processing function
source("R/functions.R")

# Importing data
filtered_utterances <- read_csv(in_path)

# Processing utterances
filtered_utterances$utterance <- filtered_utterances$utterance %>% 
  process_text() 

# Removing empty rows
filtered_utterances <- filtered_utterances %>% 
  filter(utterance != "" & utterance != " ")

# Writing output file
write.csv(filtered_utterances, out_path, row.names = FALSE)



