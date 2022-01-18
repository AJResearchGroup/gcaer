# Create sim data
# that works nicely with the 166 individuals
# in the example_tiny/HO_superpopulations file
# (https://github.com/richelbilderbeek/gcaer/issues/6)
#
# ID must match those in HO_superpopulations, see
# https://github.com/kausmees/GenoCAE/issues/22
#
# Output must be in PLINK binary format
#
library(plinkr)

# Simulate data in PLINK1 text format
set.seed(42)
assoc_qt_data <- create_demo_assoc_qt_data(
  n_individuals = 166,
  traits = create_demo_traits()
)

# Get the IDs
url <- "https://raw.githubusercontent.com/richelbilderbeek/GenoCAE/Pheno/example_tiny/HO_superpopulations" # nolint indeed a long line
pop_filename <- tempfile(pattern = "HO_superpopulations")
download.file(
  url = url,
  destfile = pop_filename,
  quiet = TRUE
)
testthat::expect_true(file.exists(pop_filename))
pops <- readr::read_csv(
  pop_filename,
  col_names = c("nationality", "continent"),
  show_col_types = FALSE
)
testthat::expect_equal(nrow(pops), 166)

# Change the IDs in the .fam file.
#
# These are now:
#
# FID ID
# 1   1
# 2   1
# 3   1
# etc
#
# Note that an ID is a within-family ID, hence all individuals are unique
# if all combinations of FID and ID are unique.
#
# Transform these to:
#
# FID      ID
# Estonian 1
# Han      2
# Kyrgyz   3
# etc
#
# Note I change ID to unique numbers just to be sure, as using a `1` in
# all cases should also work...?
#
if (1 == 2) {
  assoc_qt_data <- plinkr::rename_fids(
    data = assoc_qt_data,
    fids = pops$nationality
  )
  assoc_qt_data <- plinkr::rename_iids(
    data = assoc_qt_data,
    iids = seq_len(nrow(assoc_qt_data$data$ped_table))
  )
}

assoc_qt_data$data$ped_table$FID <- pops$nationality
assoc_qt_data$data$ped_table$IID <- seq_len(nrow(assoc_qt_data$data$ped_table))
assoc_qt_data$phenotype_data$phe_table$FID <- pops$nationality
assoc_qt_data$phenotype_data$phe_table$IID <- seq_len(nrow(assoc_qt_data$data$ped_table))

base_input_filename <- "~/gcaer_issue_6_text"
phe_filename <- paste0(base_input_filename, ".phe")
base_output_filename <- "~/gcaer_issue_6_bin"

# Convert PLINK1 text format to PLINK1 binary format
plinkr::save_plink_text_data(
  plink_text_data = assoc_qt_data$data,
  base_input_filename = base_input_filename
)
plink_bin_filenames <- plinkr::convert_plink_text_files_to_plink_bin_files(
  base_input_filename = base_input_filename,
  base_output_filename = base_output_filename
)

plinkr::save_phe_table(
  phe_table = assoc_qt_data$phenotype_data$phe_table,
  phe_filename = paste0(base_output_filename, ".phe")
)

# Done!

# But hey, if you want to inspect the data:
ped_filename <- paste0(base_input_filename, ".ped")
map_filename <- paste0(base_input_filename, ".map")
bim_table <- read_plink_bim_file(plink_bin_filenames$bim_filename)
fam_table <- read_plink_fam_file(plink_bin_filenames$fam_filename)
bed_table <- read_plink_bed_file(
  bed_filename = plink_bin_filenames$bed_filename,
  names_loci = bim_table$id,
  names_ind = fam_table$id
)
phe_table <- assoc_qt_data$phenotype_data$phe_table
