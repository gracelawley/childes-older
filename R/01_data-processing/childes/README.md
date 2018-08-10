
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




#### Notes:
* Count for types in each corpus individually, n_xxx
* Count for types across all corpora, N
* Numbers for tokens, types, type-token ratio, n transcripts, etc.

#### To Do
* For each corpus:
    * Transcripts
        + Raw =
        + Filtered = 
    * Transcripts removed:
        + e.g. Those where the child fell outside of the age range of 36-96 months
    * Number of utterances
        + Raw = 
        + Filtered = 
        + Processed = 
    * Number of tokens & types and type-token ratio
    * Top five most frequent tokens

* Transcripts removed:
    + Bloom70, Brown, Clark, Demetras1, Hall, Kuczaj, Suppes, Sachs, Warren, Weist
        + Outside of age range
    + Braunwald
        + Outside of age range
        + Those that were a part of the handwritten diary section of the study
        (the files in the `0diary` subfolder)
    + Cornell
        + Files from Haas, Horn, MOM, Moore, and Nurse sections (LSNO and
        Schacter sections included)
        + Those where the child fell outside of the age range of 36-96 months
    + EllisWeismer
        + Files for the ‘late talker’ group
        + Files from the EC and PC samples (INT and CONV samples included)
        + Those where the child fell outside of the age range of 36-96 months
        + Note!!!
            + Some of the names for the target children are not available – marked
            as NA.
            + The EllisWeismer corpus is included in both the Eng-NA (for the
            control group participants) and Clinical-MOR (for the late talker group
            participants) sections on the CHILDES database. The Eng-NA section with
            the control group participants is the part of the EllisWeismer corpus
            used here. However, when downloading the data via the childesr package,
            the collection variable is listed as Clinical-MOR for all participants,
            regardless of which group they belong to. This is corrected in
            02_ellisweismer_filter-transcripts.R and in
            03_ellisweismer_filter-utterances.R
    + MacWhinney
        + One file that was a handwritten diary
        + Those where the child fell outside of the age range of 36-96 months
        + Note! 
            + Number of raw transcript files = 288
            + Some raw transcript files contain two target children (see note) = 108
            + When there are two target children in a sample, the
            `target_child_name`, `target_child_sex`, `target_child_age`, and
            `target_child_id` variables default to `NA`. The name of the child
            speaking is tracked in the `speaker_name` variable, but the age, sex, or
            id of the child speaking is *not* tracked. These transcripts are removed
            during the `02_macwhinney_filter-transcripts.R` when filtering for
            matches to the age range criterion.
    + Weist
        + Number of raw transcripts = 183
            + Untranscribed = 3
            + Mismarked 'role' = 28
        + Note!
            + For 28 of the 183 raw transcripts, the 'role' of the target child is
            marked as 'Child', rather than the expected 'Target_Child'. Because of
            this, information about the target child's age, sex, and id are marked
            as 'NA'. To remedy this, 'Child' is included in as an option for 'role'
            in `get_utterances()`, in `01_weist_get-utterances.R`. The missing
            values were then reconstructed in `01_weist_filter-transcripts.R`. The
            reconstructed ages did not take into account days, only months and
            years.
            + Also, 3 of the transcript files did not have a transcription attached
            to them and were subsequently removed during the filtering step.

    
