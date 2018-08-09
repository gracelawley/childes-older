

## Input path -----------------------------------------------------------------
in_path = here("data/raw/childes/ellisweismer_transcripts.csv")
## ----------------------------------------------------------------------------

## Output path ----------------------------------------------------------------
out_path = here("data/processed/childes/ellisweismer_filtered-transcripts.csv")
## ----------------------------------------------------------------------------


# Read in raw transcript csv
raw_transcripts <- read_csv(in_path)


#Filtering for matches based on the project criteria
filtered_transcripts <- raw_transcripts %>% 
  # filtering out the late talkers
  filter(str_count(filename, 'latetalkers') == 0) %>% 
  # filtering out files from EC and PC samples
  filter(str_count(filename, 'ec/') == 0) %>% 
  filter(str_count(filename, 'pc/') == 0) %>% 
  # matching age range criterion
  filter(target_child_age >= 36.0 & target_child_age <= 96.0) %>% 
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

