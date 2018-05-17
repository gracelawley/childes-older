library(readr)
library(here)
library(dplyr)

## Input path ------------------------------------------------------
in_path = here("data/processed/")
## -----------------------------------------------------------------

## Output path -----------------------------------------------------
out_path = here("data/processed/all_tokens.csv")
## -----------------------------------------------------------------


# List of all corpora used
corpora <- c('bloom1970', 'braunwald', 'brown', 'clark', 
             'cornell', 'demetras-trevor', 'ellisweismer',
             'hall', 'kuczaj', 'macwhinney', 'sachs', 'suppes',
             'warren', 'weist')



# Preparing for importing corpora tokens
datalist <- vector('list', 14)
i <- 1


# Importing corpora tokens
for (corpus in corpora){
  file_name <- sprintf('%s_tokens.csv', corpus)
  file_path <- paste0(in_path, file_name)
  datalist[[i]] <- read_csv(file_path,  
                            col_types = 
                              cols(age = col_double())) # included bc of weist
  i <- i + 1
}


# Merging corpora tokens together
all_tokens <- bind_rows(datalist)


# Writing output file
write.csv(all_tokens, out_path, row.names = FALSE)

