


process_text <- function(text){
  # A function for manual cleaning of raw utterance text
  # 
  # Requires stringr and dplyr packages
  #
  # Args: 
  #   text: the string to be processed/cleaned
  # Returns:
  #   The processed string
  #
  require(stringr)
  require(dplyr)
  
  text <- text %>% 
    # between words
    str_replace_all("_", " ") %>% 
    str_replace_all("\\+", " ") %>% 
    # contractions
    str_replace_all("won't", "wont") %>% 
    str_replace_all("can't", "can nt") %>% 
    str_replace_all("don't", "do nt") %>% 
    str_replace_all("n't", "nt") %>% 
    str_replace_all("'", " ") %>% 
    # omitted words
    str_replace_all("xxx", "") %>% 
    str_replace_all("XXX", "") %>% 
    str_replace_all("XX", "") %>% 
    str_replace_all("yyy", "") %>% 
    # words in brackets 
    str_replace_all("\\[\\S+\\]", "") %>% 
    # de-identified names, e.g. 'Jwww' 
    str_replace_all("[:alpha:]www", "") %>% 
    str_replace_all("www", "") %>% 
    # changing all to lowercase
    str_to_lower() %>% 
    # to remove multiple spaces
    str_replace(" +", " ")
  
  return(text)
}

