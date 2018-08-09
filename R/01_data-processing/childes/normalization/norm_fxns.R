# Function for normalizing phrases with + signs
plus_norm <- function(phrase, dict) {
  # dict must be a character vector
  if (str_detect(phrase, "\\+")) {
    str_collapsed <- str_replace_all(phrase, "\\+", "")
    str_connected <- str_replace_all(phrase, "\\+", "_")
    
    if (str_connected %in% dict) {
      return (str_connected)
      
    } else if (str_collapsed %in% dict) {
      return (str_collapsed)
      
    } else {
      return (str_connected)
    }
    
  } else {
    return (phrase)
  }
} 

# Function for normalizing phrases with _ signs
phrase_norm <- function(phrase) {
  if (str_detect(phrase, "_")) {
    if (str_detect(phrase, "[:upper:]")) {
      return ("_prop_np_")
    } else if (str_detect(phrase, "^([:lower:]{1}_)+[:lower:]{1}s?$")) {
      phrase <- str_replace_all(phrase, "_", "")
      return (phrase)
    } else {
      phrase <- str_replace_all(phrase, "_", " ")
      return(phrase)
    }
  } else {
    return (phrase)
  }
}

# Function for normalizing capitalized words
capitals_norm <- function(word, exceptions = c("I'm", "I'll", "I've", 
                                               "I'd", "I'ma", "I'mma")) {
  if (str_detect(word, "[:upper:]")) {
    
    if (word %in% exceptions) {
      word_lower <- str_to_lower(word)
      return (word_lower)
      
    } else if (str_detect(word, "^[:upper:]('s)?$")) {
      word_lower <- str_to_lower(word)
      return (word_lower)
      
    } else {
      return("_prop_n_")
    }
    
  } else {
    return (word)
  }
}

# Function to expand exception contraction cases specific to CHILDES data
contracts_exceptions_expand <- function(string) {
  string <- string %>%
    # expand
    str_replace_all("\\bwhere'dya\\b", "whered you") %>% 
    str_replace_all("\\blem'me\\b", "let me") %>% 
    str_replace_all("\\bs'your\\b", "its your") %>% 
    str_replace_all("\\bwha'sa\\b", "whats a") %>% 
    str_replace_all("\\bwha's\\b", "whats") %>% 
    str_replace_all("\\bi'm+a\\b", "i am going to") %>% 
    str_replace_all("\\bs'pose\\b", "suppose") %>% 
    str_replace_all("\\bhow'm\\b", "how am") %>% 
    str_replace_all("\\bh'm\\b", "him") %>% 
    str_replace_all("\\bm'darl(ing)?\\b", "my darling") %>% 
    str_replace_all("\\bon't\\b", "do not") %>% 
    str_replace_all("\\ble's\\b", "let us") %>% 
    
    # remove 
    str_replace_all("\\bla'm\\b", "_na_") %>% 
    str_replace_all("\\ban't\\b", "_na_") %>% 
    str_replace_all("\\ba'\\b", "_na_") %>% 
    str_replace_all("\\bs'm\\b", "_na_")
  
}


# Function to expand general contraction cases
contracts_general_expand <- function(string) {
  string <- string %>% 
    # common special cases
    str_replace_all("\\bwon't\\b", "will not") %>% 
    str_replace_all("\\blet's\\b", "let us") %>% 
    str_replace_all("\\bi'm\\b", "i am") %>% 
    
    # standarizing can't & cannot to both map to can not
    str_replace_all("\\bcan't\\b", "can not") %>% 
    str_replace_all("\\bcannot\\b", "can not") %>% 
    
    # uncommon special cases
    str_replace_all("\\bc'mon\\b", "come on") %>% 
    str_replace_all("\\bc'me+re\\b", "come here") %>% 
    
    # for o'clock, etc. 
    str_replace_all("\\bo'", "o") %>% 
    
    # common general cases
    str_replace_all("n't\\b", " not") %>% 
    str_replace_all("n'ts\\b", " nots") %>% 
    str_replace_all("'re\\b", " are") %>% 
    str_replace_all("'ve\\b", " have") %>% 
    str_replace_all("'ll\\b", " will") %>% 
    str_replace_all("^y'", "you ") %>% 
    str_replace_all("\\b'em\\b", "them") %>% 
    str_replace_all("^'t", "it ") %>% 
    
    # ambiguous cases
    str_replace_all("'d\\b", "d") %>% 
    str_replace_all("'s\\b", "s") %>% 
    str_replace_all("'($| )", "") %>% 
    str_replace_all("\\bain't\\b", "aint")  # at least one aint in erpa
}

# Drop coded words
code_wds_drop <- function(string) {
  string <- string %>% 
    str_replace_all("\\b[:alpha:]*xxx[:alpha:]*\\b", "_na_") %>% 
    str_replace_all("\\byyy\\b", "_na_")
}