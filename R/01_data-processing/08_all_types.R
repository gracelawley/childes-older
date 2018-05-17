library(here)
library(readr)
library(dplyr)

## Input path ------------------------------------------------------
in_path = here("data/processed/all_tokens.csv")
## -----------------------------------------------------------------

## Output path -----------------------------------------------------
out_path = here("data/processed/all_types.csv")
## -----------------------------------------------------------------

# Importing data
all_tokens <- read_csv(in_path)

# Gathering types
all_types <- all_tokens %>% 
  # some light reorganization
  select(-corpus, -child, -sex,
         -age, -filename, -date) %>% 
  # isolating the types
  distinct()


# Writing output file
write.csv(all_types, out_path, row.names = FALSE)


