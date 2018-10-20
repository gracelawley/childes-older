# =============================================================================
# Filtering the raw utterances against the previously filtered transcripts.
# Only utterances that are from the transcripts that remain (i.e. after the 
# previous script 02_filter-raw-transcripts.R has been run) are kept. Writes
# one .csv file with the newly filtered utterances.
# 
# Output file:
#     - data/processed/filtered_utterances.csv
#
# =============================================================================


# Setting output file path
out_path <- here("data", "childes", "processed", "filtered_utterances.csv")


# Filtering utterances with a dplyr "filtering join" 
fil_utterances <- raw_utterances %>% 
  semi_join(fil_transcripts, by = "transcript_id")


# Writing output .csv file
write_csv(fil_utterances, out_path)


