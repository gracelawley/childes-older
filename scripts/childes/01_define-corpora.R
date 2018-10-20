# =============================================================================
# Defining the corpora to be used in the scripts that follow and creating a  
# dataframe with the collection names and corpora names and saving as a .csv
# 
# Corpora to be used:
#     1. Bloom70 // Eng-NA
#     2. Braunwald // Eng-NA
#     3. Brown // Eng-NA
#     4. Clark // Eng-NA
#     5. Cornell // Eng-NA
#     6. Demestras1 // Eng-NA
#     7. Ellisweismer // Clinical-MOR 
#     8. Hall // Eng-NA
#     9. Kuczaj // Eng-NA
#     10. MacWhinney // Eng-NA
#     11. Sachs // Eng-NA
#     12. Suppes // Eng-NA
#     13. Warren // Eng-NA
#     14. Weist // Eng-NA
#
# Output file:
#    - data/raw/corpora-info.csv
#
# =============================================================================

# Setting output file path
out_path <- here("data", "childes", "raw", "corpora-info.csv")


# Creating dataframe of corpora and collection names
corpora_info <- rbind(c('Eng-NA', 'Bloom70'), 
                 c('Eng-NA', 'Braunwald'), 
                 c('Eng-NA', 'Brown'),
                 c('Eng-NA', 'Clark'),
                 c('Eng-NA', 'Cornell'),
                 c('Eng-NA', 'Demetras1'),
                 c('Clinical-MOR', 'EllisWeismer'),
                 c('Eng-NA', 'Hall'),
                 c('Eng-NA', 'Kuczaj'),
                 c('Eng-NA', 'MacWhinney'),
                 c('Eng-NA', 'Sachs'),
                 c('Eng-NA', 'Suppes'),
                 c('Eng-NA', 'Warren'),
                 c('Eng-NA', 'Weist')) %>% 
  as_data_frame() %>% 
  rename(collection = V1, corpus = V2)


# Writing output csv file
write_csv(corpora_info, out_path)

