# =============================================================================
# Normalize tokens by using the normalized types that were mapped in the
# previous script. After tokens are normalized via mappings, any phrases that 
# were split into multiple tokens are unnested by splitting on white space.
# Writes one .csv file.
#
#
# Output files:
#     - data/processed/post-norm_tokens.csv
#
# =============================================================================

# Setting output file path
out_path <- here("data", "childes", "processed", "post-norm_tokens.csv")


# Mapping tokens to corresponding normalized type
normed_tokens <- tokens %>% 
  left_join(normed_types, by = c("token" = "type")) %>% 
  rename(normed_token = normed_type, n_token = n_type) %>% 

  # Separating any phrases that were split into tokens by splitting on whitespace
  unnest_tokens(output = normed_token, input = normed_token, token = "regex",
                pattern = "[:space:]") %>% 
  
  # Adding a new count column for the normed_token's
  add_count(normed_token) %>% 
  rename(n_normed_token = n)


# Writing output .csv file
write_csv(normed_tokens, out_path)


