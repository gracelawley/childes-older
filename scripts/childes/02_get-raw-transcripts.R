# =============================================================================
# Pulling down the raw transcript information for the chosen corpora from the 
# CHILDES database via the `childesr` package. Writes one .csv file with the 
# combined transcript information for all of the chosen corpora. The version
# of the database used is included in the output file name.
#
# Output file:
#     - data/raw/transcripts_vXXXX.X.csv
#
# =============================================================================

# Getting current database version for records
db_version <- get_database_version()

# Setting output file paths with database version information
out_path <- here("data", "childes", "raw", 
                 str_c("transcripts_v", db_version, ".csv"))


# Creating character vectors for the corpus and collection names
corpus_names <- pull(corpora_info, corpus)
collection_names <- pull(corpora_info, collection)



# Pulling down transcript information by corpus and combining into one dataframe
raw_transcripts <- map2(collection_names, corpus_names, get_transcripts) %>% 
  bind_rows()


# Writing output .csv file
write_csv(raw_transcripts, out_path)

