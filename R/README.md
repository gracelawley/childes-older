
## braunwald\_get-transcripts.R

  - Script that gathers list of available transcripts from `childesr`
  - Creates a dataframe with only the columns needed going forwards;
    columns omitted:
      - `language`, `corpus_id`, `target_child_id`, `collection_id`, and
        `pid`

## braunwald\_get-utterances.R

  - Script that gathers list of utterances avaialble from `childesr`
  - Creates a dataframe with only the columns needed going forwards;
    columns ommited:
      - `id`, `speaker_id`, `utterance_order`, `corpus_id`, `stem`,
        `part_of_speech`, `speaker_code`, `target_child_id`, `type`,
        `media_end`, `media_start`, `media_unit`, `collection_id`,
        `num_morphemes`, and `language`
