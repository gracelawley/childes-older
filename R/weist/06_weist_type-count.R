library(here)
library(readr)
library(dplyr)

## Input path ------------------------------------------------------
in_path = here("data/processed/weist_tokens.csv")
## -----------------------------------------------------------------

## Output path -----------------------------------------------------
out_path = here("data/processed/weist_type-count.csv")
## -----------------------------------------------------------------

# Importing data
## Need to specific column type for age since read_csv uses only 
## the first 1000 rows to predict column type
tokens <- read_csv(in_path, col_types = 
                     cols(age = col_double())) 

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


