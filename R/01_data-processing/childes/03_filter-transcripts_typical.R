# Continuation of & dependent on: `02a_filter-transcripts_exceptions.R`
#
# Script for filtering transcripts for the TYPICAL corpora cases and then 
# merging with those of the exception corpora cases previously gathered. 
# Transcripts are filtered against the inclusion criteria specified by the
# project. Writes csv files for each corpus individually & also a csv file 
# for all corpora together.


# File paths ==================================================================
indiv_out_path <- tolower(corpora$corpus) %>% 
  map(~ paste0("data/processed/childes/", .x, "_filtered-transcripts.csv")) %>% 
  here()

all_out_path <- here("data/processed/childes/all_filtered-transcripts.csv")
# =============================================================================


# Indices for the typical cases
typical <- which(!corpora$corpus %in% exceptions)


# Filtering typical corpora only & adding to dataframe
fil_transcripts[typical] <- raw_transcripts[typical] %>% 
  map(~ filter(.x, target_child_age >= 36.0 & target_child_age <= 96.0))


# Some light reorganization
fil_transcripts <- fil_transcripts %>% 
  map(~ arrange(.x, target_child_age)) %>% 
  map(~ select(.x, -language, -corpus_id, -collection_id, 
               -pid, -target_child_id)) %>% 
  map(~ rename(.x, collection = collection_name, corpus = corpus_name,
               child = target_child_name, sex = target_child_sex,
               age = target_child_age)) %>% 
  map(~ select(.x, db_version, collection, corpus, child, sex, age,
               transcript_id, filename, date))


# Merging into df of filtered transcripts for all corpora
all_fil_transcripts <- bind_rows(fil_transcripts)


# Writing output files for individual corpora
map2(fil_transcripts, indiv_out_path, write_csv)

# Writing output files for all corpora together
write_csv(all_fil_transcripts, all_out_path)




# Clean up ====================================================================

# Clearing all of global environment except `corpora` 
rm(list=setdiff(ls(), "corpora"))  

# =============================================================================
  
  
  
  
  