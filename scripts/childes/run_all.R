# =============================================================================
# Run all steps of CHILDES cleaning, processing, & normalization pipeline
# =============================================================================

source("scripts/childes/00_load-packages.R")

source("scripts/childes/01_define-corpora.R")

source("scripts/childes/02_get-raw-transcripts.R")
source("scripts/childes/02_get-raw-utterances.R")


# Doing a fresh run of the cmu-dict processing pipeline
source("scripts/cmu-dict/run_all.R")


source("scripts/childes/03_filter-raw-transcripts.R")
source("scripts/childes/04_filter-raw-utterances.R")

source("scripts/childes/05_get-tokens.R")
source("scripts/childes/06_get-types.R")

source("scripts/childes/07_normalize-types.R")
source("scripts/childes/08_normalize-tokens.R")