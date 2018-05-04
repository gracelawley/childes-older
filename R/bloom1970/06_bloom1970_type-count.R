library(here)
library(readr)
library(dplyr)

## Input path ------------------------------------------------------
in_path = here("data/processed/bloom1970_tokens.csv")
## -----------------------------------------------------------------

## Output path -----------------------------------------------------
out_path = here("data/processed/bloom1970_type-count.csv")
## -----------------------------------------------------------------

# Importing data
tokens <- read_csv(in_path)

# Some light reorganization
types <- tokens %>% 
  select(-child, -sex, -age,
         -filename, -date)

# Calculating type count
types <- types %>% 
  group_by(word) %>% 
  mutate(n = n())

# Some more reorganization
types <- types %>% 
  distinct() %>% 
  arrange(desc(n))


# Writing output file
write.csv(types, out_path, row.names = FALSE)


