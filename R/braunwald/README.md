
#### 01\_braunwald\_get-transcripts.R

  - Pulling down raw transcripts via the `childesr` package

#### 01\_braunwald\_get-utterances.R

  - Pulling down raw utterances via the `childesr` package

#### 02\_braunwald\_filter-transcripts.R

  - Filtering raw transcripts against the project specific criteria.
      - Number of raw transcripts: 900
      - Number after filtering: 72
  - The removed transcripts included:
      - Those that where the child fell outside of the age range of
        36-96 months  
      - Those that were a part of the handwritten diary section of the
        study
          - The files in the `0diary` subfolder

#### 03\_braunwald\_filter-utterances.R

  - Filtering out utterances that were in the transcripts that were
    removed in the previous script,
    \`02\_braunwald\_filter-transcripts.R’
      - Number of raw utterances: 39,750
      - Number after filtering: 12,084

#### 04\_braunwald\_proc-utterances.R

  - Processing utterances with `process_text()` from
    `process_text_fxn.R`

#### 05\_braunwald\_token-split.R

  - Splitting utterances into tokens
      - Number of tokens: 34,821
  - Top five most frequent tokens:
    1.  i – 1,939
    2.  you – 895
    3.  it – 890
    4.  s – 856
    5.  the – 791
