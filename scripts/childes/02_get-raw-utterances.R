# =============================================================================
# Pulling down the raw utterances for the chosen corpora from the CHILDES
# database via the `childesr` package. Writes one .csv file with the combined
# utterances for all of the chosen corpora. The version of the database used is
# included in the output file name.
#
# Output file:
#     - data/raw/utterances_vXXXX.X.csv
#
# =============================================================================


# Setting output file path with database version information
out_path <- here("data", "childes", "raw", 
                 str_c("utterances_v", db_version, ".csv"))



# Pulling down utterances by corpus and combining into one dataframe
raw_utterances <- map2(collection_names, corpus_names,
                   ~ get_utterances(collection = .x, 
                                    corpus = .y, 
                                    role = "Target_Child")) %>% 
  bind_rows()


# Writing output .csv file
write_csv(raw_utterances, out_path)











