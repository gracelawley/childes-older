# Script to pull down transcript information from CHILDES database via the
# `childesr` package. Writes csv files for each corpus individually & also 
# writes a csv file with all of the corpora together


# File paths ==================================================================
indiv_out_path <- tolower(corpora$corpus) %>% 
                map(~ paste0('data/raw/childes/', .x, '_transcripts.csv')) %>% 
                here()

all_out_path <- here('data/raw/childes/all_transcripts.csv')
# =============================================================================


# Getting current database version for records
version <- get_database_version()



# Gathering transcript info by corpus
transcripts <- map2(corpora$collection, corpora$corpus, get_transcripts) %>% 
  map2(version, ~ mutate(.x, db_version = .y)) 

# Merging into df of transcript info for all corpora
all_transcripts <- bind_rows(transcripts) 



# Writing output files for individual corpora
map2(transcripts, indiv_out_path, write_csv)

# Writing output file for all corpora together
write_csv(all_transcripts, all_out_path)




# Clean up ====================================================================

# Clearing all of global environment except `corpora` 
rm(list=setdiff(ls(), "corpora"))  

# =============================================================================

  

