## Script to run all steps in CHILDES processing folder

# 00 - Initial Setup ==========================================================
source("R/01_data-processing/childes/00_setup.R")
# =============================================================================


# 01 - Pulling Down Raw Data ==================================================
# source("R/01_data-processing/childes/01_get-transcripts.R")
# source("R/01_data-processing/childes/01_get-utterances.R")
# =============================================================================


# 02 - Filtering Transcripts ==================================================
#source("R/01_data-processing/childes/02a_filter-transcripts_exceptions.R")
#source("R/01_data-processing/childes/02b_filter-transcripts_typical.R")
# =============================================================================



# 03 - Filtering Utterances ===================================================
source("R/01_data-processing/childes/03_filter-utterances.R")
# =============================================================================


# 04 - Processing Utterances ==================================================
#source("R/01_data-processing/childes/04_proc-utterances.R")
# =============================================================================



#source("R/01_data-processing/childes/STATS.R")
