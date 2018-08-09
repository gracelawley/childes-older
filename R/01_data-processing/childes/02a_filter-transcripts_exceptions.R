# Script for filtering transcripts for the exception corpora cases only. 
# Transcripts are filtered against the inclusion criteria specified by the
# project. 
#
# Exception corpora cases: 
# Braunwald, Cornell, EllisWeismer, MacWhinney, and Weist


# File paths ==================================================================
in_paths <- tolower(corpora$corpus) %>% 
  map(~ paste0("data/raw/childes/", .x, "_transcripts.csv")) %>% 
  here()
# =============================================================================


# Exception cases
exceptions <- c("Braunwald", "Cornell", "EllisWeismer", "MacWhinney", "Weist")


# Reading in raw transcripts
raw_transcripts <- map(in_paths, read_csv)

# Initializing list vector for filtered transcripts
fil_transcripts <- vector("list", length(raw_transcripts))




# Braunwald -------------------------------------------------------------------
braunwald <- which(corpora$corpus == "Braunwald")  # storing index

# Filtering transcripts
fil_transcripts[[braunwald]] <- raw_transcripts[[braunwald]] %>% 
  # matching age range criterion
  filter(target_child_age >= 36.0 & target_child_age <= 96.0) %>% 
  # removing files from handwritten diary section
  filter(str_count(filename, "0diary") == 0)



# Cornell ---------------------------------------------------------------------
cornell <- which(corpora$corpus == "Cornell")  # storing index

# Filtering transcripts
fil_transcripts[[cornell]] <- raw_transcripts[[cornell]] %>% 
  # only keeping LSNO and Schacter files
  filter(str_count(filename, 'lsno') == 1 | 
           str_count(filename, 'sch') == 1) %>% 
  # matching age range criterion
  filter(target_child_age >= 36.0 & target_child_age <= 96.0)



# EllisWeismer ----------------------------------------------------------------
ellisweismer <- which(corpora$corpus == "EllisWeismer")  # storing index

# Filtering transcripts
fil_transcripts[[ellisweismer]] <- raw_transcripts[[ellisweismer]] %>%
  # filtering out the late talkers
  filter(str_count(filename, 'latetalkers') == 0) %>% 
  # filtering out files from EC and PC samples
  filter(str_count(filename, 'ec/') == 0) %>% 
  filter(str_count(filename, 'pc/') == 0) %>% 
  # matching age range criterion
  filter(target_child_age >= 36.0 & target_child_age <= 96.0)



# MacWhinney ------------------------------------------------------------------
macwhinney <- which(corpora$corpus == "MacWhinney")  # storing index

# Filtering Transcripts
fil_transcripts[[macwhinney]] <- raw_transcripts[[macwhinney]] %>% 
  # removing handwritten diary file
  filter(str_count(filename, '01diary') == 0) %>% 
  # matching age range criterion
  filter(target_child_age >= 36.0 & target_child_age <= 96.0)



# Weist -----------------------------------------------------------------------
weist <- which(corpora$corpus == "Weist")  # storing index

# Isolating & fixing mismarked transcripts that meet the age range criterion  
weist_mismarked <- raw_transcripts[[weist]] %>% 
  filter(is.na(target_child_age) & 
           (str_count(filename, '/03') == 1 | str_count(filename, '/04') == 1)) %>% 
  # Fixing target_child_age (excluding days)
  mutate(year = as.numeric(str_extract(filename, '[:digit:]{2}')),
         month = as.numeric(str_extract(filename, '(?<=[:digit:]{2})[:digit:]{2}'))) %>% 
  mutate(target_child_age = year*12 + month) %>% 
  select(-year, -month) %>% 
  # Fixing target_child_name
  mutate(target_child_name = str_extract(filename, '(?<=Weist/)[:alpha:]+(?=/)')) %>% 
  # Fixing target_child_sex
  mutate(target_child_sex = case_when(
    target_child_name == 'Emily' ~ 'female',
    target_child_name != 'Emily' ~ 'male')) %>% 
  # Fixing target_child_id (except for Ben)
  mutate(target_child_id = case_when(
    target_child_name == 'Emily' ~ 4872,
    target_child_name == 'Matt' ~ 4898,
    target_child_name == 'Roman' ~ 4909))


# Filtering and adding in fixed version of mismarked transcripts
fil_transcripts[[weist]] <- raw_transcripts[[weist]] %>% 
  # Matching age range criterion
  filter((target_child_age >= 36.0 & target_child_age <= 96.0)) %>% 
  # Combining fixed version of the mismarked ones
  bind_rows(weist_mismarked)







