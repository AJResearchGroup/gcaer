gcae_options <- gcaer::create_gcae_options(
  gcae_folder = "/opt/GenoCAE",
  ormr_folder_name = "python3"
)
gcaer::gcaer_report(gcae_options = gcae_options)
gcaer::run_gcae(args = "--help", gcae_options = gcae_options, verbose = TRUE)

