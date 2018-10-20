# =============================================================================
# Splitting the newly filtered utterances on white space to create a dataframe
# of tokens. Writes one .csv file.
#
# Output file:
#     - data/processed/pre-norm_tokens.csv
#
# =============================================================================

# Setting output file path
out_path <- here("data", "childes", "processed", "pre-norm_tokens.csv")


# Tokenizing filtered utterances
tokens <- fil_utterances %>% 
  unnest_tokens(output = token, input = gloss, token = "regex", 
                pattern = "[:space:]", to_lower = FALSE) 


# Writing output .csv file
write_csv(tokens, out_path)

