# =============================================================================
# Normalize types and create a dataframe of the original type and its 
# corresponding normalized mapping. Uses functions from the normalize_childes.R
# file. Uses the processed version of cmu-dict created in 01/clean_cmu-dict.R
# script. Writes one .csv file.
# 
# What is done:
#     1. Normalize plus signs using plus_norm()
#     2. Normalize underscores/phrases using phrase_norm()
#     3. Normalize words with capital letters using capitals_norm()
#     4. Normalize coded words using code_wds_norm()
#
# What is NOT done:
#     - Normalize contractions using contracts_expand_excp() followed
#       by contracts_expand_gen(). If I want to add this back in later
#       include it after phrase_norm() and before code_wds_norm().
#
#
# Input file:
#     - functions/normalize_childes.R
# Output file:
#     - data/processed/post-norm_types.csv
#
# =============================================================================


# Setting input and output file paths
in_path <- here("functions", "normalize_childes.R")
out_path <- here("data", "childes", "processed", "post-norm_types.csv")


# Loading normalization functions
source(in_path)


# Normalize types 
normed_types <- types %>% 
  
  # 1. Normalize plus signs
  mutate(normed_type = map_chr(type, plus_norm, cmu_proc$entry)) %>% 
  
  # 2. Normalize underscores/phrases
  mutate(normed_type = map_chr(normed_type, phrase_norm)) %>% 
  
  # 3. Normalize words with capital letters
  mutate(normed_type = map_chr(normed_type, capitals_norm)) %>% 
  
  # # Normalize contractions
  # mutate(normed_type = map_chr(normed_type, contracts_expand_excp),
  #        normed_type = map_chr(normed_type, contracts_expand_gen)) %>% 
  
  # Normalize coded words
  mutate(normed_type = map_chr(normed_type, code_wds_norm)) 



# Writing output .csv file
write_csv(normed_types, out_path)




