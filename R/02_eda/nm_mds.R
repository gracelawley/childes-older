library(here)
library(readr)
library(dplyr)
library(stringr)
library(tidyr)

## Input path ------------------------------------------------------
types_in_path = here("data/processed/all_types.csv")
file_in_path = here('data/processed/')
## -----------------------------------------------------------------


# List of all corpora used
corpora <- c('bloom1970', 'braunwald', 'brown', 'clark', 
             'cornell', 'demetras-trevor', 'ellisweismer',
             'hall', 'kuczaj', 'macwhinney', 'sachs', 'suppes',
             'warren', 'weist')

# Creating lists of file names/paths for corpora
file_names <- paste0(corpora, '_type-count.csv')
file_paths <- paste0(file_in_path, file_names)

# Importing/combining individual corpora type counts
file_data <- lapply(file_paths, read_csv)
corpora_type_count <- bind_rows(file_data)


# Importing csv of all types
all_types <- read_csv(types_in_path)


# Creating the frequency list
freq_list <- data.frame(unique(corpora_type_count[, 1:3])) %>% 
  group_by(db_version, collection, corpus) %>% 
  # Adding in column of all types
  expand(word = all_types$word) %>% 
  # Adding in type counts 
  left_join(corpora_type_count,
            by = c('db_version', 'collection',
                   'corpus', 'word')) %>% 
  # Changing unseen types from NA to 0
  replace_na(list(n = 0))


freq_list <- freq_list %>% 
  mutate(n_transformed = log10(n+1))






freq_list2 <- ungroup(freq_list) %>% 
  dplyr::select(word, corpus, n_transformed) %>% 
  spread(key = corpus, value = n_transformed) 

# Calculating correlation matrix
M <- freq_list2 %>% 
  select(-word) %>% 
  cor()


library(MASS)
test_MDS <- isoMDS(d = 1-M, k = 2)


