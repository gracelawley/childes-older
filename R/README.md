
#### 01\_xxx\_get-transcripts.R

  - Pulling down raw transcripts via the `childesr` package

#### 01\_xxx\_get-utterances.R

  - Pulling down raw utterances via the `childesr` package

#### 02\_xxx\_filter-transcripts.R

  - Filtering raw transcripts against the project specific criteria

#### 03\_xxx\_filter-utterances.R

  - Filtering out utterances that were in the transcripts that were
    removed in the previous script, \`02\_xxx\_filter-transcripts.R’

#### 04\_xxx\_proc-utterances.R

  - Processing utterances with `process_text()` from
    `process_text_fxn.R`

#### 05\_xxx\_token-split.R

  - Splitting utterances into tokens

#### 06\_xxx\_type-count.R

  - Grouping tokens into types and calculating frequency
