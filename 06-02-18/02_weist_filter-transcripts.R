

## Input path -----------------------------------------------------------------
in_path = here("data/raw/childes/weist_transcripts.csv")
## ----------------------------------------------------------------------------

## Output path ----------------------------------------------------------------
out_path = here("data/processed/childes/weist_filtered-transcripts.csv")
## ----------------------------------------------------------------------------


# Read in raw transcript csv
raw_transcripts <- read_csv(in_path)


# Isolating the mismarked transcripts that match the age range criterion and fixing the missing values
mismarked <- raw_transcripts %>% 
  filter(is.na(target_child_age) & 
           (str_count(filename, '/03') == 1 | str_count(filename, '/04') == 1)) %>% 
  
  # Fixing target_child_age (excluding days)
  mutate(year = as.numeric(str_extract(filename, '[:digit:]{2}')),
         month = as.numeric(str_extract(filename, '(?<=[:digit:]{2})[:digit:]{2}'))) %>% 
  mutate(target_child_age = year*12 + month) %>% 
  select(-year, -month) %>% 
  
  # Fixing target_child_name
  mutate(target_child_name = str_extract(filename, '(?<=Weist/)[:alpha:]+(?=/)')) %>% 
  
  # Fixing target_child_sex
  mutate(target_child_sex = case_when(
    target_child_name == 'Emily' ~ 'female',
    target_child_name != 'Emily' ~ 'male')) %>% 
  
  # Fixing target_child_id (except for Ben)
  mutate(target_child_id = case_when(
    target_child_name == 'Emily' ~ 4872,
    target_child_name == 'Matt' ~ 4898,
    target_child_name == 'Roman' ~ 4909))
  


# Filtering for regular matches and combining fixed up version of mismatches
filtered_transcripts <- raw_transcripts %>% 
  # Matching age range criterion
  filter((target_child_age >= 36.0 & target_child_age <= 96.0)) %>% 
  # Combining fixed version of the mismarked ones
  bind_rows(mismarked) %>% 
  arrange(target_child_age)


# Some light reorganization
filtered_transcripts <- filtered_transcripts %>%
  select(-language, -corpus_id, -collection_id, -pid,
         -target_child_id) %>%
  rename(collection = collection_name, corpus = corpus_name,
         child = target_child_name, sex = target_child_sex,
         age = target_child_age) %>%
  select(db_version, collection, corpus, child, sex, age,
         transcript_id, filename, date)



# Writing output file
write.csv(filtered_transcripts, out_path, row.names = FALSE)


# Cleaning up global environment while keeping output of 00_setup.R
rm(list=setdiff(ls(), "corpora")) 

