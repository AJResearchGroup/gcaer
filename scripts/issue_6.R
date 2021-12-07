# Create sim data
# that works nicely with the 166 individuals
# in the example_tiny/HO_superpopulations file
# (https://github.com/richelbilderbeek/gcaer/issues/6)
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

base_input_filename <- "~/gcaer_issue_6_text"
phe_filename <- paste0(base_input_filename, ".phe")
base_output_filename <- "~/gcaer_issue_6_bin"

# Convert PLINK1 text format to PLINK1 binary format
plinkr::save_plink_text_data(
  plink_text_data = assoc_qt_data$data,
  base_input_filename = base_input_filename
)
# plinkr::save_plink_bin_data(
#   plink_bin_data = assoc_qt_data,
#   base_input_filename = base_output_filename
# )
# plinkr::save_ped_table_to_file(
#   ped_table = assoc_qt_data$data$ped_table,
#   ped_filename = ped_filename
# )
# plinkr::save_map_table_to_file(
#   map_table = assoc_qt_data$data$map_table,
#   map_filename = map_filename
# )
# plinkr::save_phe_table(
#   phe_table = assoc_qt_data$phenotype_data$phe_table,
#   phe_filename = phe_filename
# )
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
