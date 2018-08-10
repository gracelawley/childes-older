# Script to pull down utterances from CHILDES database via the `childesr`
# package. Writes csv files for each corpus individually & also writes a
# csv file with all of the corpora together

# File paths ==================================================================
indiv_out_path <- tolower(corpora$corpus) %>% 
  map(~ paste0("data/raw/childes/", .x, "_utterances.csv")) %>% 
  here()

all_out_path <- here("data/raw/childes/all_utterances.csv")
# =============================================================================


# Getting current database version for records
version <- get_database_version()

# Role to use
role_to_get <- "Target_Child"


# Gathering and saving transcript info by corpus
utterances <- map2(corpora$collection, corpora$corpus, 
                   ~ get_utterances(collection = .x, corpus = .y, 
                                    role = role_to_get))

# Adding column with database version used
utterances <- utterances %>% 
  map2(version, ~ mutate(.x, db_version = .y))


# Merging into df of utterances for all corpora
all_utterances <- bind_rows(utterances)



# Writing output files for individual corpora
map2(utterances, indiv_out_path, write_csv)

# Writing output file for all corpora together
write_csv(all_utterances, all_out_path)




# Clean up ====================================================================

# Clearing all of global environment except `corpora` 
rm(list=setdiff(ls(), "corpora"))  

# =============================================================================
