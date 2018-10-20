# Script to split utterances into tokens


# File paths ==================================================================
in_path <- here("data/processed/childes/all_proc-utterances.csv")

out_path <- here("data/processed/childes/all_tokens.csv")
# =============================================================================

# Importing processed utterances
proc_utterances <- read_csv(in_path)


# Tokenizing into unigrams with tidytext::unnest_tokens
unigrams <- proc_utterances %>% 
  unnest_tokens(output = unigram, input = utterance, token = "ngrams", n = 1)


# Tokenizing into unigrams following Penn Treebank tokenization 
ptb <- proc_utterances %>% 
  unnest_tokens(output = ptb, input = utterance, token = "ptb")



