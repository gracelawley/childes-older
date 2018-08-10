# Script to normalize types and create a dataframe of the original word and its
# normalized mapping. 


# File paths ==================================================================
types_in_path <- here("data/processed/childes/all_types_pre-norm.csv")
cmu_in_path <- here("data/processed/ref-corpora/cmu-dict-0.7b_proc.csv")


types_out_path <- here("data/processed/childes/all_types_norm_mappings.csv")
# =============================================================================


# Loading in helper normalization functions
source("functions/normalize.R")


# Reading in processed types pre-norm & processed cmu dictionary
types <- read_csv(types_in_path)
cmu_dict <- read_csv(cmu_in_path)


# Pulling out vector of cmu words
cmu_words <- pull(cmu_dict, entry)



# Normalizing types 
types <- types %>% 
  
  # Normalize plus signs
  mutate(mapping = map_chr(word, plus_norm, cmu_words)) %>% 
  
  # Normalize underscores/phrases
  mutate(mapping = map_chr(mapping, phrase_norm)) %>% 
  
  # Normalize words with capital letters 
  mutate(mapping = map_chr(mapping, capitals_norm)) %>% 
  
  # Normalize contractions
  #mutate(mapping = map_chr(contracts_exceptions_expand)) %>% 
  #mutate(mapping = map_chr(contracts_general_expand)) %>% 
  
  # Normalize coded words
  mutate(mapping = map_chr(mapping, code_wds_norm))



# Writing output file of original types and their normalized mappings
write_csv(types, types_out_path)



# Clean up ====================================================================

# Clearing all of global environment except `corpora` 
rm(list=setdiff(ls(), "corpora"))  

# =============================================================================


