test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()

  # This test goes through the full workflow.
  # It is not broken up into small pieces, as each 'small piece'
  # takes multiple seconds to run.
  #
  # 1. Setup
  # 2. Train
  # 3. Project
  # 4. Plot

  # 1. Setup
  datadir <- file.path(get_gcae_subfolder(), "example_tiny/")
  data <- "issue_6_bin"
  gcae_setup <- create_gcae_setup(
    datadir = datadir,
    data = data,
    model_id = "M0",
    pheno_model_id = "p2"
  )
  superpops <- clean_file_path(file.path(datadir, "HO_superpopulations"))

  # 2. Train, approx 3 mins
  Sys.time()
  train_filenames <- gcae_train(
    gcae_setup = gcae_setup,
    epochs = 1,
    save_interval = 1
  )
  expect_true(all(file.exists(train_filenames)))

  # 3. Project
  # Error:
  # Encoded data file not found:
  # /home/richel/.local/share/gcaer/gcae_v1_0/ae_out/ae.M1.ex3.b_0_4.issue_6_bin/issue_6_bin/encoded_data.h5
  #
  # which is reasonable:
  #
  # /home/richel/.local/share/gcaer/gcae_v1_0/ae_out/ae.M1.ex3.b_0_4.issue_6_bin.p1/issue_6_bin/encoded_data.h5
  #                                                                             ^^^
  # as the phenotype is not added ----------------------------------------------+++
  #
  # Traceback (most recent call last):
  #   File "/home/richel/.local/share/gcaer/gcae_v1_0/run_gcae.py", line 1616, in <module>
  #   main()
  # File "/home/richel/.local/share/gcaer/gcae_v1_0/run_gcae.py", line 1185, in main
  # epochs = get_saved_epochs(train_directory)
  # File "/home/richel/.local/share/gcaer/gcae_v1_0/utils/data_handler.py", line 758, in get_saved_epochs
  # for i in os.listdir(train_directory+"/weights"):
  #   FileNotFoundError: [Errno 2] No such file or directory: '/home/richel/.local/share/gcaer/gcae_v1_0/ae_out/ae.M1.ex3.b_0_4.issue_6_bin/weights'
  Sys.time()
  project_filenames <- gcae_project(
    superpops = superpops,
    gcae_setup = gcae_setup,
    verbose = TRUE
  )

  # project_results <- parse_project_files(project_filenames)
  expect_equal(
    names(project_results),
    c("losses_from_project_table", "genotype_concordances_table")
  )

  # 4. Plot
  plot_filenames <- gcae_plot(
    superpops = superpops,
    gcae_setup = gcae_setup,
    gcae_options = gcae_options,
    verbose = TRUE
  )
  plot_filenames

})
