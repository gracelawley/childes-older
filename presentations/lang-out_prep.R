library(tidyverse)
library(knitr)
library(kableExtra)
library(ggrepel)

tokens_normed <- read_csv("presentations/data/tokens_normed.csv")
tokens_not_normed <- read_csv("presentations/data/tokens_not_normed.csv")
word_mappings <- read_csv("presentations/data/word_mappings.csv")
fil_transcripts <- read_csv("presentations/data/all_filtered-transcripts.csv")
fil_utts <- read_csv("presentations/data/all_filtered-utterances.csv")


fil_trans_stats <- fil_transcripts %>% 
  count(corpus) %>% 
  rename(n_trns = n)


fil_stats <- tokens_not_normed %>% 
  # calculate token count
  add_count(corpus) %>% 
  rename(fil_n_tokens = n) %>% 
  
  # calculate type count & type-token-ratio
  group_by(corpus) %>% 
  mutate(fil_n_types = n_distinct(word),
         fil_ttr = fil_n_types/fil_n_tokens) %>% 
  ungroup() %>% 
  
  # reorganize
  distinct(corpus, .keep_all = TRUE) %>% 
  select(-child, -word) %>% 

  # join with fil_transcripts_stats
  left_join(fil_trans_stats, by = "corpus") %>% 
  
  # reorganize again
  select(corpus, n_trns, fil_n_tokens, fil_n_types, fil_ttr)



# Messy examples
plus_signs <- tokens_not_normed %>% 
  filter(str_detect(word, "\\+")) %>% 
  count(word, sort = TRUE)


underscores <- tokens_not_normed %>% 
  filter(str_detect(word, "_")) %>% 
  count(word, sort = TRUE)

prop_np <- tokens_not_normed %>% 
  filter(str_detect(word, "_")) %>% 
  filter(str_detect(word, "[:upper:]")) %>% 
  count(word, sort = TRUE)

prop_n <- tokens_not_normed %>% 
  filter(!str_detect(word, "_")) %>% 
  filter(str_detect(word, "[:upper:]")) %>% 
  count(word, sort = TRUE)


# after normalization -------

norm_stats <- tokens_normed %>% 
  # calculate token count
  add_count(corpus) %>% 
  rename(norm_n_tokens = n) %>% 
  
  # calculate type count & type-token-ratio
  group_by(corpus) %>% 
  mutate(norm_n_types = n_distinct(word),
         norm_ttr = norm_n_types/norm_n_tokens) %>% 
  ungroup() %>% 
  
  # reorganize
  distinct(corpus, .keep_all = TRUE) %>% 
  select(-child, -word)
%>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% 

stats <- fil_stats %>% 
  left_join(norm_stats, by = "corpus")






# ggplot(stats, aes(reorder(corpus, -fil_ttr), fil_ttr, label = corpus)) +
#   geom_col(fill = "darkslategrey", alpha = 0.75) +
#   labs(y = "type-token ratio", x = "corpus", title = "Before Normalization") +
#   theme_minimal() +
#   theme(axis.text.x = element_text(angle = 45)) 
# 
# ggplot(stats, aes(reorder(corpus, -fil_ttr), fil_ttr, label = corpus)) +
#   geom_col(aes(reorder(corpus, -fil_ttr), norm_ttr), fill = "blue", alpha = 0.75) +
#   labs(y = "type-token ratio", x = "corpus", title = "After Normalization") +
#   theme_minimal() +
#   theme(axis.text.x = element_text(angle = 45)) 
# 
# 
# ggplot(stats, aes(reorder(corpus, -fil_ttr), fil_ttr, label = corpus)) +
#   geom_col(fill = "darkslategrey", alpha = 0.75) +
#   geom_col(aes(reorder(corpus, -fil_ttr), norm_ttr), fill = "blue", alpha = 0.4) +
#   labs(y = "type-token ratio", x = "corpus") +
#   theme_minimal() +
#   theme(axis.text.x = element_text(angle = 45)) 




#write_csv(stats, "presentations/data/stats.csv")



