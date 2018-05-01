library(here)
library(dplyr)
library(readr)
library(stringr)

## Input path ------------------------------------------------------
in_path = here("data/raw/braunwald_raw-transcripts.csv")
## -----------------------------------------------------------------

## Output path -----------------------------------------------------
out_path = here("data/processed/braunwald_filtered-transcripts.csv")
## -----------------------------------------------------------------

# Read in raw transcript csv
raw_transcripts <- read_csv(in_path)

# Filtering for matches by project criteria
proc_transcripts <- raw_transcripts %>% 
  filter(age >= 36.0 & age <= 96.0,   #age range criteria
         str_count(file, '0diary') == 0)  %>%   #omit files from diary section
  arrange(age)

# Writing output file
write.csv(proc_transcripts, out_path, row.names = FALSE)