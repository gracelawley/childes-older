## Script to run all steps in CHILDES processing folder

# 00 - Initial Setup ==========================================================
source("R/01_data-processing/childes/00_load-packages.R")
source("R/01_data-processing/childes/00_pick-corpora.R")
# =============================================================================


# 01 - Pulling Down Raw Data ==================================================
source("R/01_data-processing/childes/01_get-transcripts.R")
source("R/01_data-processing/childes/01_get-utterances.R")
# =============================================================================


# 02 & 03 - Filtering Transcripts ==================================================
source("R/01_data-processing/childes/02_filter-transcripts_exceptions.R")
source("R/01_data-processing/childes/03_filter-transcripts_typical.R")
# =============================================================================


# 04 - Filtering Utterances ===================================================
source("R/01_data-processing/childes/04_filter-utterances.R")
# =============================================================================


# 05 - Splitting Tokens (pre-normalization) ===================================
source("R/01_data-processing/childes/05_tokenize-pre-norm.R")
# =============================================================================


# 06 - Normalizing Types =====================================================
source("R/01_data-processing/childes/06_normalize-types.R")
# =============================================================================


# 07 - Normalizing Tokens =====================================================
source("R/01_data-processing/childes/07_normalize-tokens.R")
# =============================================================================



#source("R/01_data-processing/childes/STATS.R")
