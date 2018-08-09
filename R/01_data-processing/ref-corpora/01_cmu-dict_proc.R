# Script to clean up cmu-dict-0.7b. All processing decisions were made in an
# effort to match those made for the processing of the CHILDES corpora as 
# closely as possible. Writes a csv file containing the processed version
# of cmu-dict-0.7b in a dataframe structure.
#
# Entry processing: 
# - strings are converted to lowercase
# - all phonemic information is removed
# - parentheses and their contents (markers originally for multiple 
#   pronunciations) are removed
# - descriptive punctuation included at the beginning of an entry is removed
# - all periods at the end of words (including before "'s") are removed
# - all remaining periods are changed to underscores
# - all hyphens are changed to underscores
# - all extra whitespace is trimmed
# - duplicate entries created as a result of processing are removed
#
#
# NOTE: entries containing digits were NOT omitted or further altered



# File paths ==================================================================
in_path <- here('data/raw/ref-corpora/cmudict-0.7b.txt')

out_path <- here('data/processed/ref-corpora/cmu-dict-0.7b_proc.csv')
# =============================================================================


# Importing raw cmu-dict
cmu_raw_data <- read_lines(in_path, skip = 56)
cmu_raw <- data_frame(entry = cmu_raw_data)

# Initializing proc cmu-dict df
cmu_proc <- cmu_raw


# Processing cmu-dict
cmu_proc$entry <- cmu_proc$entry %>% 
  
  # changing everything to lowercase
  str_to_lower() %>% 
  
  # removing phonemes
  str_replace_all("[:space:]+.*", "") %>% 
  
  # removing parentheses and their contents
  str_replace_all("\\(.*\\)", "") %>% 
  
  # removing start of string punctuation
  ## [:punct:] is supposed to catch + but for some reason fails to do so
  str_replace_all("^[:punct:]+", "") %>% 
  
  ## removing + from start of string
  str_replace_all("^\\++", "") %>% 
  
  # removing all periods at end of words
  str_replace_all("\\.$", "") %>%   # occurs alone
  str_replace_all("\\.(?=\\')", "") %>%  # followed by a '
  
  # changing all remaining periods to underscores (i.e. initials) 
  str_replace_all("\\.", "_") %>% 
  
  # changing all hyphens to underscores
  str_replace_all("-", "_") %>% 
  
  # removing any extra whitespace
  str_trim()



# Removing any duplicate entries created
cmu_proc <- cmu_proc %>% 
  distinct() %>% 
  arrange(entry)



# Writing output file
write_csv(cmu_proc, out_path)


# Cleaning up global environment 
rm(list = ls())

