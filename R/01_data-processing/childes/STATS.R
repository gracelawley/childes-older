# TESTING

# Input Paths -----------------------------------------------------------------
raw_trns_in_path <- here(paste0('data/raw/childes/',
                                tolower(corpora$corpus),
                                '_transcripts.csv'))
proc_trans_path <- here(paste0('data/processed/childes/',
                            tolower(corpora$corpus),
                            '_filtered-transcripts.csv'))

raw_utt_path <- here(paste0('data/raw/childes/',
                           tolower(corpora$corpus),
                           '_utterances.csv'))
proc_utt_path <- here(paste0('data/processed/childes/',
                             tolower(corpora$corpus),
                             '_filtered-utterances.csv'))

# Importing Files -------------------------------------------------------------
raw_transcripts <- map(raw_trns_in_path, read_csv)
filtered_transcripts <- map(proc_trans_path, read_csv)
raw_utterances <- map(raw_utt_path, read_csv)
filtered_utterances <- map(proc_utt_path, read_csv)

# Calculating Stats -----------------------------------------------------------
stats <- data_frame(corpus = corpora$corpus,
                    raw_transcripts = as_vector(map(raw_transcripts, nrow)),
                    filtered_transcripts = as_vector(map(filtered_transcripts, nrow)),
                    raw_utterances = as_vector(map(raw_utterances, nrow)),
                    filtered_utterances = as_vector(map(filtered_utterances, nrow)))



