# Script to process the filtered utterances in `all_filtered-utterances.csv`.
# Writes a csv file containing the processed utterances for all corpora.
#
# Utterance processing:
# - strings are converted to lowercase
# - fully/partially coded words are removed (e.g. xxx's, yyy, _xxx in aunt_xxx)
# - plus signs (+) between words to signify a phrase are replaced with 
#   underscores (_)
# - coded names are removed (e.g. jwww, jwww's)
# - all extra whitespace is trimmed


# File paths ==================================================================
in_path <- here("data/processed/childes/all_filtered-utterances.csv")

out_path <- here("data/processed/childes/all_proc-utterances.csv")
# =============================================================================


# Reading in filtered utterances
fil_utterances <- read_csv(in_path)


# Initializing processed utterances df
proc_utterances <- fil_utterances

proc_utterances$utterance <- proc_utterances$utterance %>%
  str_replace_all("[:upper:][:alpha:]+(\\'s|s\\')?", "") 



# # Processing utterances
# proc_utterances$utterance <- proc_utterances$utterance %>% 
#   
#   # changing everything to lowercase
#   str_to_lower() %>%  
#   
#   # removing fully & partially coded words
#   str_replace_all("[:graph:]?(xxx|yyy)[:graph:]*", "") %>% 
#   
#   # replacing + with _ for consistency
#   str_replace_all("\\+", "_") %>% 
#   
#   # removing coded names, e.g. 'Jwww'
#   str_replace_all("_?\\w?www(\\'s)?_?", " ") %>%  
#   
#   # removing extra whitespace
#   str_trim()
# 
# 
# 
# # Filtering out empty utterance rows   
# proc_utterances <- proc_utterances %>% 
#   drop_na(utterance) %>% 
#   filter(utterance != "")



# Writing output file
#write_csv(proc_utterances, out_path)



# Cleaning up global environment while keeping output of 00_setup.R
#rm(list=setdiff(ls(), "corpora"))

