# =============================================================================
# Cleaning and processing the raw cmu-dict-0.7b file. All cleaning and
# processing decisions were made in an effort to match the decisions made for
# the cleaning & processing of the CHILDES corpora as closely as possible.
# Writes one .csv file containing the processed version of cmu-dict-0.7b.
#
# Cleaning & Processing Decisions:
#     - Strings are converted to lowercase
#     - All phonemic information is removed
#     - Parentheses and their contents (markers originally for multiple 
#       pronunciations) are removed
#     - Descriptive punctuation at the beginning of an entry is removed
#     - All periods at the end of words (including before "'s") are removed
#     - All remaining periods are changed to underscores
#     - All hyphens are changed to underscores
#     - All extra whitespace is trimmed
#     - Duplicate entries created as a result of processing are removed
#     * NOTE: entries containing digits are NOT removed or further altered
#
# Input file:
#     - data/raw/cmudict-0.7b.txt
#
# Output file:
#     - data/processed/proc_cmu-dict.csv
#
# =============================================================================


# Setting intput file path
in_path <- here("data", "cmu-dict", "raw", "cmudict-0.7b.txt")


# Setting output file path
out_path <- here("data", "cmu-dict", "processed", "proc_cmu-dict.csv")


# Reading in raw cmu-dict file and creating a dataframe
cmu_raw <- read_lines(in_path, skip = 56) %>% 
  data_frame(entry = .)


# Processing entry column
cmu_proc <- cmu_raw %>% 
  
  # Changing entries to all lowercase
  mutate(entry = str_to_lower(entry)) %>% 
  
  # Removing phonemes after the word(s)
  mutate(entry = str_replace_all(entry, "[:space:]+.*", "")) %>% 
  
  # Removing parentheses and their contents
  mutate(entry = str_replace_all(entry, "\\(.*\\)", "")) %>% 
  
  # Removing start of string punctuation 
  #  - [:punct:] fails to catch "+", not sure why
  mutate(entry =  str_replace_all(entry, "^[:punct:]+", "")) %>% 
  
  # Removing "+" from the start of string
  mutate(entry = str_replace_all(entry, "^\\++", "")) %>% 
  
  # Removing all periods at the ends of words; both the lone occurence and when
  # followed by an apostrophe: "'"
  mutate(entry = str_replace_all(entry, "\\.$", ""),
         entry = str_replace_all(entry, "\\.(?=\\')", "")) %>%
  
  # Changing all remaining periods to underscores (i.e. initials)
  mutate(entry = str_replace_all(entry, "\\.", "_")) %>% 
  
  # Changing all hyphens to underscores
  mutate(entry = str_replace_all(entry, "-", "_")) %>% 

  # Removing any extra whitespace
  mutate(entry = str_trim(entry))


# Removing any duplicate entries that were created
cmu_proc <- cmu_proc %>% 
  distinct() %>% 
  arrange(entry)


# Writing output .csv file
write_csv(cmu_proc, out_path)



