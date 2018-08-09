library(here)
library(readr)
library(dplyr)

## Input path ------------------------------------------------------
in_path = here("data/processed/childes/ellisweismer_proc-utterances.csv")
## -----------------------------------------------------------------

## Output path -----------------------------------------------------
out_path = here("data/processed/childes/ellisweismer_tokens.csv")
## -----------------------------------------------------------------

# Importing data
proc_utterances <- read_csv(in_path)

# Tokenizing on empty spaces
tokens <- proc_utterances %>% 
  unnest_tokens(word, utterance,
                token = stringr::str_split,
                pattern = " +") %>% 
  filter(word != "")


# Writing output file
write.csv(tokens, out_path, row.names = FALSE)

