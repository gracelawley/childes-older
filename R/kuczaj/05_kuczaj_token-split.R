library(here)
library(readr)
library(dplyr)

## Input path ------------------------------------------------------
in_path = here("data/processed/kuczaj_proc-utterances.csv")
## -----------------------------------------------------------------

## Output path -----------------------------------------------------
out_path = here("data/processed/kuczaj_tokens.csv")
## -----------------------------------------------------------------

# Importing data
proc_utterances <- read_csv(in_path)

# Tokenizing on empty spaces
tokens <- proc_utterances %>% 
  unnest_tokens(word, utterance,
                token = stringr::str_split,
                pattern = " +") %>% 
  filter(word != "")

# Quick frequency table aside
freq <- tokens %>% 
  group_by(word) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))


# Writing output file
write.csv(tokens, out_path, row.names = FALSE)

