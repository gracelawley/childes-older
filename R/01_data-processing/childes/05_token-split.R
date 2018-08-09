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


tokens <- unigrams %>% 
  select(unigram)
phrase_indices <- str_detect(tokens$unigram, "\\_")
phrases <- tokens[phrase_indices,] %>% count(unigram) %>% distinct()



# Tokenizing into unigrams following Penn Treebank tokenization 
ptb <- proc_utterances %>% 
  unnest_tokens(output = ptb, input = utterance, token = "ptb")





childes <- unigrams %>% select(unigram)
cmu_dict <- read_csv("data/processed/ref-corpora/cmu-dict-0.7b_proc.csv")


matches <- semi_join(childes, cmu_dict, by = c("unigram" = "entry")) %>% count(unigram)

misses <- anti_join(childes, cmu_dict, by = c("unigram" = "entry")) %>% 
  count(unigram)

underscores <- str_detect(misses$unigram, "\\_")
misses_underscores <- misses[underscores,]
