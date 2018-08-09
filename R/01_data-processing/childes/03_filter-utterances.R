# Script for filtering utterances against the already filtered transcripts.
# Utterances kept are only those from transcripts that meet the inclusion 
# criteria specified by the project.


# File paths ==================================================================
trns_in_path <- tolower(corpora$corpus) %>% 
  map(~ paste0("data/processed/childes/", .x, "_filtered-transcripts.csv")) %>% 
  here()

utt_in_path <- tolower(corpora$corpus) %>% 
  map(~ paste0("data/raw/childes/", .x, "_utterances.csv")) %>% 
  here()


indiv_out_path <- tolower(corpora$corpus) %>% 
  map(~ paste0("data/processed/childes/", .x, "_filtered-utterances.csv")) %>% 
  here()

all_out_path <- here("data/processed/childes/all_filtered-utterances.csv")
# =============================================================================


# Reading in filtered transcripts
fil_transcripts <- map(trns_in_path, read_csv)

# Reading in raw utterances
raw_utterances <- map(utt_in_path, read_csv)


# Some light reorganization
raw_utterances <- raw_utterances %>% 
  map(~ select(.x, -id, -speaker_id, -utterance_order, -corpus_id, 
               -num_tokens, -stem, -speaker_code, 
               -speaker_name, -speaker_role, -target_child_id, 
               -media_end, -media_start, -media_unit, -collection_id, 
               -num_morphemes, -language, -target_child_age)) %>% 
  map(~ rename(.x, utterance = gloss, child = target_child_name, 
               sex = target_child_sex, collection = collection_name, 
               corpus = corpus_name, pos = part_of_speech)) %>%
  map(~ select(.x, db_version, collection, corpus, child, sex, utterance, 
               pos, type, transcript_id)) %>% 
  map(~ drop_na(.x, utterance))
        

# Filtering utterances
fil_utterances <- raw_utterances %>% 
  map2(fil_transcripts, inner_join)



# Some more reorganization
fil_utterances <- fil_utterances %>% 
  map(~ select(.x, -transcript_id)) %>% 
  map(~ select(.x, -utterance, -pos, -type, everything())) %>%  # moving to far right col
  map(~ arrange(.x, age))



# Merging into df of filtered utterances for all corpora  
all_fil_utterances <- bind_rows(fil_utterances)



# Writing output files for individual corpora
map2(fil_utterances, indiv_out_path, write_csv)

# Writing output file for all corpora together
write_csv(all_fil_utterances, all_out_path)




# Cleaning up global environment while keeping output of 00_setup.R
rm(list=setdiff(ls(), "corpora"))
