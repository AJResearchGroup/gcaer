message("------------------")
message("Show plinkr report")
message("------------------")
plinkr::plinkr_report(plink_optionses = plinkr::create_plink_optionses(plink_folder = "/opt/plinkr"))

message("----------------")
message("Show ormr report")
message("----------------")
ormr::ormr_report(ormr_folder_name = "python3", verbose = TRUE)


message("--------------------")
message("Get the GCAE options")
message("--------------------")
gcae_options <- gcaer::create_gcae_options(
  gcae_folder = "/opt/gcae_richel",
  ormr_folder_name = "python3"
)

message("-----------------")
message("Is GCAE installed?")
message("-----------------")
gcaer::is_gcae_installed(gcae_options = gcae_options, verbose = TRUE)

message("-----------------")
message("Show gcaer report")
message("-----------------")
gcaer::gcaer_report(gcae_options = gcae_options)

# message("-----------------")
# message("Show GCAE help   ")
# message("-----------------")
# gcaer::run_gcae(args = "--help", gcae_options = gcae_options, verbose = TRUE)

