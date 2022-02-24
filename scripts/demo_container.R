message("------------------")
message("Show plinkr report")
message("------------------")

plinkr::plinkr_report(plink_optionses = plinkr::create_plink_optionses(plink_folder = "/opt/plinkr"))

message("----------------")
message("Show ormr report")
message("----------------")
ormr::ormr_report(ormr_folder_name = "python3", verbose = TRUE)

message("-----------------")
message("Show gcaer report")
message("-----------------")
gcae_options <- gcaer::create_gcae_options(
  gcae_folder = "/opt/GenoCAE",
  ormr_folder_name = "python3"
)

gcaer::is_gcae_installed(gcae_options = gcae_options, verbose = TRUE)

gcaer::gcaer_report(gcae_options = gcae_options)
gcaer::run_gcae(args = "--help", gcae_options = gcae_options, verbose = TRUE)

