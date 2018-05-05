
# The 14 Corpora Individually

#### xxx/01\_xxx\_get-transcripts.R

  - Pulling down raw transcripts via the `childesr` package
  - *Output:* data/raw/xxx\_transcripts.csv

#### xxx/01\_xxx\_get-utterances.R

  - Pulling down raw utterances via the `childesr` package
  - *Output:* data/raw/xxx\_utterances.csv

#### xxx/02\_xxx\_filter-transcripts.R

  - Filtering raw transcripts against the project specific criteria  
  - *Input:* data/raw/xxx\_transcripts.csv
  - *Output:* data/processed/xxx\_filtered-transcripts.csv

#### xxx/03\_xxx\_filter-utterances.R

  - Filtering out utterances that were in the transcripts that were
    removed in the previous script, 02\_xxx\_filter-transcripts.R
  - *Input:*
      - data/processed/xxx\_filtered-transcripts.csv
      - data/raw/xxx\_utterances.csv
  - *Output:* data/processed/xxx\_filtered-utterances.csv

#### xxx/04\_xxx\_proc-utterances.R

  - Processing utterances with `process_text()` from
    process\_text\_fxn.R
  - The decrease in total number of utterances that occurs during this
    step is due to empty rows being removed
  - *Input:* data/processed/xxx\_filtered-utterances.csv
  - *Output:* data/processed/xxx\_proc-utterances.csv

#### xxx/05\_xxx\_token-split.R

  - Splitting utterances into tokens
  - *Input:* data/processed/xxx\_proc-utterances.csv
  - *Output:* data/processed/xxx\_tokens.csv

#### xxx/06\_xxx\_type-count.R

  - Grouping tokens into types and calculating frequency
  - *Input:* data/processed/xxx\_tokens.csv
  - *Output:* data/processed/xxx\_type-count.csv

# All 14 Corpora Together

#### 07\_all\_merge-tokens.R

  - Merging xxx\_tokens.csv files for each of the 14 corpora together
    into one file  
  - *Input:* data/processed/xxx\_tokens.csv  
  - *Output:* data/processed/all\_tokens.csv

#### 08\_all\_type-count.R

  - Grouping tokens from all\_tokens.csv into types and calculating:
      - `n_overall`: overall count per type, across all 14 corpora
      - `n_corpus`: count per type by each of the 14 corpora
        individually
  - *Input:* data/processed/all\_tokens.csv
  - *Output:* data/processed/all\_type-count.csv

#### Number of tokens & types:

  - Tokens = 1091939
  - Types = 16982
  - Type-Token Ratio = 0.0155522
