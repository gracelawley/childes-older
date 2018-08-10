# Script to tokenize utterances *before* normalization by splitting on white 
# space. Creates a list of tokens and types.
#
# Writes two csv files: 
# (1) All tokens pre-norm for all corpora
# (2) All types pre-norm for all corpora


# File paths ==================================================================
utt_in_path <- here("data/processed/childes/all_filtered-utterances.csv")

tokens_out_path <- here("data/processed/childes/all_tokens_pre-norm.csv")
types_out_path <- here("data/processed/childes/all_types_pre-norm.csv")
# =============================================================================


# Reading in filtered utterances
fil_utts <- read_csv(utt_in_path)



# Tokenizing filtered utterances into tokens by splitting on white spaces
tokens <- fil_utts %>% 
  # removing sentence metadata
  select(-pos, -type) %>% 
  unnest_tokens(output = word, input = utterance, token = "regex", 
                pattern = "[:space:]", to_lower = FALSE) 



# Creating dataframe of types and global count
types <- tokens %>% 
  count(word)


# Writing output file for tokens
write_csv(tokens, tokens_out_path)

# Writing output file for types
write_csv(types, types_out_path)




# Clean up ====================================================================

# Clearing all of global environment except `corpora` 
rm(list=setdiff(ls(), "corpora"))  

# =============================================================================
