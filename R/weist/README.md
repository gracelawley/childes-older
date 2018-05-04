
# Weist Corpus

#### Number of transcripts:

  - Raw = 183
      - Untranscribed = 3
      - Mismarked ‘role’ = 28
  - Filtered = 99

#### Transcripts removed:

  - Those where the child fell outside of the age range of 36-96 months

#### Number of utterances:

  - Raw = 46,766
  - Filtered = 24,863
  - Processed = 24,539

#### Number of tokens & types:

  - Tokens = 115,780
  - Types = 4,210
  - Type-Token Ratio = 0.0363621

#### Top five most frequent tokens:

1.  i – 5936
2.  the – 3313
3.  it – 3093
4.  s – 3048
5.  yeah – 3037

#### <span style="color:red">Note\!</span>

For 28 of the 183 raw transcripts, the ‘role’ of the target child is
marked as ‘Child’, rather than the expected ‘Target\_Child’. Because of
this, information about the target child’s age, sex, and id are marked
as ‘NA’. To remedy this, ‘Child’ is included in as an option for ‘role’
in `get_utterances()`, in `01_weist_get-utterances.R`. The missing
values were then reconstructed in `01_weist_filter-transcripts.R`. The
reconstructed ages did not take into account days, only months and
years.

Also, 3 of the transcript files did not have a transcription attached to
them and were subsequently removed during the filtering step.