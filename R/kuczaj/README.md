
#### 01\_kuczaj\_get-transcripts.R

  - Pulling down raw transcripts via the `childesr` package

#### 01\_kuczaj\_get-utterances.R

  - Pulling down raw utterances via the `childesr` package

#### 02\_kuczaj\_filter-transcripts.R

  - Filtering raw transcripts against the project specific criteria.
      - Number of raw transcripts: 210
      - Number after filtering: 150
  - The removed transcripts included:
      - Those that where the child fell outside of the age range of
        36-96 months

#### 03\_kuczaj\_filter-utterances.R

  - Filtering out utterances that were in the transcripts that were
    removed in the previous script, \`02\_kuczaj\_filter-transcripts.R’
      - Number of raw utterances: 31,958
      - Number after filtering: 21,873

#### 04\_kuczaj\_proc-utterances.R

  - Processing utterances with `process_text()` from
    `process_text_fxn.R`

#### 05\_kuczaj\_token-split.R

  - Splitting utterances into tokens
      - Number of tokens: 122,780
  - Top five most frequent tokens:
    1.  i -\> 7,272
    2.  it – 3,716
    3.  you - 3,528
    4.  the - 3,047
    5.  a - 2,754
