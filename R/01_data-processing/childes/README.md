
# Processing Scripts


#### `00_load-packages.R`
- Loading all packages to be used


#### `00_pick-corpora.R`
- Defining which corpora will be used 


#### `01_get-transcripts.R`
- Pulling down raw transcripts via the `childesr` package
- **Output:**
    + `data/raw/childes/xxx_transcripts.csv`
    + `data/raw/childes/all_transcripts.csv`
    

#### `01_get-utterances.R`
- Pulling down raw utterances via the `childesr` package
- **Output:**
    + `data/raw/childes/xxx_utterances.csv`
    + `data/raw/childes/all_utterances.csv`


#### `02_filter-transcripts_exceptions.R`
- Filtering raw transcripts against the my project inclusion/exclusion criteria **(insert link to documentation)** for the *exception* cases
- **Add details about exception cases**
- **Input:**
    + `data/raw/childes/xxx_transcripts.csv`
    

#### `03_filter-transcripts_typical.R`
- Filtering raw transcripts against the my project inclusion/exclusion criteria **(insert link to documentation)** for the *typical* cases
- A continuation of `02_filter-transcripts_exceptions.R`
- **Output:**
    + `data/processed/childes/xxx_filtered-transcripts.csv`
    + `data/processed/childes/all_filtered-transcripts.csv`
    
    
#### `04_filter-utterances.R`
- Filtering out utterances that are in the transcripts that were just filtered out in `03_filter-transcripts_exceptions.R` and `04_filter-transcripts_typical.R`
- **Input:**
    + `data/processed/childes/xxx_filtered-transcripts.csv`
    + `data/raw/childes/xxx_utterances.csv`
- **Output:**
    + `data/processed/childes/xxx_filtered-utterances.csv`
    + `data/processed/childes/all_filtered-utterances.csv`


#### `05_tokenize-pre-norm.R`
- Splitting utterances into tokens and creating list of types and global type count
- **Input:**
    + `data/processed/childes/all_filtered-utterances.csv`
- **Output:**
    + `data/processed/childes/all_tokens_pre-norm.csv`
    + `data/processed/childes/all_types_pre-norm.csv`


#### `06_normalize-types.R`
- Normalizing types and saving a dataframe of word mappings
- **add details about normalization**
- **Input:**
    + `data/processed/childes/all_types_pre-norm.csv`
    + `data/processed/ref-corpora/cmu-dict-0.7b_proc.csv`
    + `functions/normalize.R`
- **Output:**
    + `data/processed/childes/all_types_norm_mappings.csv`


#### `07_normalize-tokens.R`
- Normalize tokens based on word mappings from `06_normalize-types.R` and re-tokenize any phrases and have been split
- **Input:**
    + `data/processed/childes/all_types_norm_mappings.csv`
    + `data/processed/childes/all_tokens_pre-norm.csv`
- **Output:**
    + `data/processed/childes/all_tokens_post-norm.csv`



#### 08\_all\_gather-corpus-types.R

  - Grouping tokens from all\_tokens.csv into types by corpus and
    calculating:
      - `n_overall`: overall count per type, across all 14 corpora
      - `n_corpus`: count per type by each of the 14 corpora
        individually
  - *Input:* data/processed/all\_corpus\_tokens.csv
  - *Output:* data/processed/all\_corpus\_types.csv

#### 08\_all\_gather-overall-types.R

  - Group tokens from all\_corpus\_tokens.csv into types of the union of
    all 14 corpora and calculating:
      - `n`: overall count per type, across all 14 corpora
  - *Input:* data/processed/all\_corpus\_tokens.csv
  - *Output:* data/processed/all\_overall\_types.csv

#### Number of tokens & types overall:

  - Tokens = 1091939
  - Types = 16982
  - Type-Token Ratio = 0.0155522
