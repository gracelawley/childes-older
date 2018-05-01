library(childesr)
library(dplyr)
library(stringr)

# getting info about all available files
transcripts <- get_transcripts(collection = 'Eng-NA',
                               corpus = 'Braunwald',
                               target_child = 'Laura')

# filtering for only matches by criteria
matches <- transcripts %>% 
  select(transcript_id, filename, target_child_age) %>% 
  filter(str_count(filename, '0diary') == 0, # files from written diary section
         target_child_age >= 36.0 & target_child_age <= 96.0)


# getting all utterances 
utterances <- get_utterances(collection = 'Eng-NA',
                             corpus = 'Braunwald',
                             target_child = 'Laura',
                             role = 'Target_Child',
                             age = c(36, 96)) ### think issue is here

# filtering by  matched files
utterances <- utterances %>% 
  select(corpus = corpus_name, child = target_child_name, 
         age = target_child_age, sex = target_child_sex, 
         utterance = gloss, transcript_id)

utterances <- utterances %>% 
  semi_join(matches, by = 'transcript_id')


# what happens to the utterances from the last file?? it gets cut off - compared to kyles