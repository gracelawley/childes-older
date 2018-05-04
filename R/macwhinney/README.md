
# MacWhinney Corpus

#### Number of transcripts:

  - Raw = 288
      - Contain two target children (see note) = 108
  - Filtered = 120

#### Transcripts removed:

  - One file that was a handwritten diary
  - Those where the child fell outside of the age range of 36-96 months

#### Number of utterances:

  - Raw = 53,634
  - Filtered = 19,637
  - Processed = 19,395

#### Number of tokens & types:

  - Tokens = 104,170
  - Types = 4,431
  - Type-Token Ratio = 0.0425362

#### Top five most frequent tokens:

1.  i – 4,847
2.  and – 3,564
3.  the – 3,260
4.  you – 3,008
5.  yeah – 2,219

#### <span style="color:red">Note\!</span>

When there are two target children in a sample, the `target_child_name`,
`target_child_sex`, `target_child_age`, and `target_child_id` variables
default to `NA`. The name of the child speaking is tracked in the
`speaker_name` variable, but the age, sex, or id of the child speaking
is *not* tracked. These transcripts are removed during the
`02_macwhinney_filter-transcripts.R` when filtering for matches to the
age range criterion.
