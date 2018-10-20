# =============================================================================
# Filtering the raw transcripts against the inclusion criteria specified by my
# project. The corpora are separated into two groups:
#     1. Typical cases
#     2. Exception cases
#
# The exception case group includes corpora which had some unique quality and/or
# issue that required additional work to filter. The corpora in the exception 
# case group are:
#     - Braunwald
#     - Cornell
#     - EllisWeismer
#     - MacWhinney
#     - Weist
#
# Writes one .csv file with the newly filtered transcript information.
# 
# Output file:
#     - data/processed/filtered_transcripts.csv
#
# =============================================================================

# Setting output file path
out_path <- here("data", "childes", "processed", "filtered_transcripts.csv")



fil_transcripts <- raw_transcripts %>% 
  # Removing Weist problem rows to handle separately and add back in later
  filter(corpus_name != "Weist" |
         corpus_name == "Weist" & !is.na(target_child_age)) %>%
  # Handling Braunwald exception case
  filter(corpus_name != "Braunwald" |
         corpus_name == "Braunwald" & str_count(filename, "0diary") == 0) %>% 
  # Handling Cornell exception case
  filter(corpus_name != "Cornell" |
         corpus_name == "Cornell" & (str_count(filename, "lsno") == 1 |
                                     str_count(filename, "sch") == 1)) %>%
  # Handling EllisWeismer exception case
  filter(corpus_name != "EllisWeismer" |
         corpus_name == "EllisWeismer" & str_count(filename, "latetalkers") == 0 &
                                         str_count(filename, "ec/") == 0 &
                                         str_count(filename, "pc/") == 0) %>% 
  # Handling MacWhinney exception case
  filter(corpus_name != "MacWhinney" |
         corpus_name == "MacWhinney" & str_count(filename, "01diary") == 0)
  
  


# Handling the Weist exception case 
weist_corrected_rows <- raw_transcripts %>% 
  
  # Extracting the issue rows
  filter(corpus_name == "Weist" & is.na(target_child_age)) %>% 
  
  # Calculating the missing target_child_age values using info in the filename values
  mutate(year = as.numeric(str_extract(filename, '[:digit:]{2}')),
         month = as.numeric(str_extract(filename, '(?<=[:digit:]{2})[:digit:]{2}')),
         target_child_age = year * 12 + month) %>% 
  select(-year, -month) %>% 
  
  # Fixing the missing target_child_name values using info in the filename value
  mutate(target_child_name = str_extract(filename, '(?<=Weist/)[:alpha:]+(?=/)')) %>% 
  
  # Fixing the missing target_child_sex values
  mutate(target_child_sex = case_when(
    target_child_name == 'Emily' ~ 'female',
    target_child_name != 'Emily' ~ 'male')) %>% 
  
  # Fixing the missing target_child_id values (except for Ben)
  mutate(target_child_id = case_when(
    target_child_name == 'Emily' ~ 4872,
    target_child_name == 'Matt' ~ 4898,
    target_child_name == 'Roman' ~ 4909))



# Adding back in the now fixed Weist problem rows
fil_transcripts <- fil_transcripts %>% 
  bind_rows(weist_corrected_rows)



# Final filter! Filtering against age criterion 
fil_transcripts <- fil_transcripts %>% 
  filter((target_child_age >= 36.0 & target_child_age <= 96.0))



# Writing output .csv file
write_csv(fil_transcripts, out_path)

