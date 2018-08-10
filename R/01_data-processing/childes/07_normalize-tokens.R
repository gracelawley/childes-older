# 


# File paths ==================================================================
types_in_path <- here("data/processed/childes/all_types_norm_mappings.csv")
tokens_in_path <- here("data/processed/childes/all_tokens_pre-norm.csv")


tokens_out_path <- here("data/processed/childes/all_tokens_post-norm.csv")
# =============================================================================


# Reading in type mappings & tokens pre-norm
type_mappings <- read_csv(types_in_path)
tokens_pre_norm <- read_csv(tokens_in_path)


# Mapping tokens to corresponding normalized word
tokens_post_norm <- tokens_pre_norm %>% 
  left_join(type_mappings, by = "word") %>% 
  select(-n, -word, word = mapping) %>% 

  # Unnesting into tokens for any phrases that were split
  unnest_tokens(output = word, input = word, token = "regex",
                pattern = "[:space:]")



# Writing output file of normalized tokens
write_csv(tokens_post_norm, tokens_out_path)



# Clean up ====================================================================

# Clearing all of global environment except `corpora` 
rm(list=setdiff(ls(), "corpora"))  

# =============================================================================