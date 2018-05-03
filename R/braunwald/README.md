
#### 01\_braunwald\_get-transcripts.R

  - Pulling down raw transcripts via the `childesr` package

#### 01\_braunwald\_get-utterances.R

  - Pulling down raw utterances via the `childesr` package

#### 02\_braunwald\_filter-transcripts.R

  - Filtering raw transcripts against the project specific criteria.  
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
