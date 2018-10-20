# =============================================================================
# Creating a dataframe of types with a global count for each word from the 
# previously created dataframe of tokens. Writes one .csv file.
#
# Output file:
#     - data/processed/pre-norm_types.csv
#
# =============================================================================

# Setting output file path
out_path <- here("data", "childes", "processed", "pre-norm_types.csv")


# Creating dataframe of types with global count column
types <- tokens %>% 
  count(token) %>% 
  rename(type = token, n_type = n)


# Writing output .csv file
write_csv(types, out_path)


