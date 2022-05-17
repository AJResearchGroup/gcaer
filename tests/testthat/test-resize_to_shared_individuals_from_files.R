test_that("use, resize phe_table", {
  if (!plinkr::is_plink_installed()) return()
  gcae_input_filenames <- create_gcae_input_files_1(
    base_input_filename = file.path(
      get_gcaer_tempfilename(),
      "resize_to_shared_individuals_from_files"
    )
  )

  # Modify the phenotype table
  phe_table <- plinkr::read_plink_phe_file(gcae_input_filenames$phe_filename)
  new_phe_table <- phe_table[seq(1, 2), ]
  plinkr::save_phe_table(
    phe_table = new_phe_table,
    phe_filename = gcae_input_filenames$phe_filename
  )

  before <- summarise_gcae_input_files(gcae_input_filenames)

  resize_to_shared_individuals_from_files(gcae_input_filenames)

  after <- summarise_gcae_input_files(gcae_input_filenames)

  expect_true(any(as.integer(after) != as.integer(before)))

  file.remove(as.character(unlist(gcae_input_filenames)))
})

test_that("use, resize phe_table, without labels table", {
  if (!plinkr::is_plink_installed()) return()
  gcae_input_filenames <- create_gcae_input_files_1(
    base_input_filename = file.path(
      get_gcaer_tempfilename(),
      "resize_to_shared_individuals_from_files"
    )
  )
  gcae_input_filenames$labels_filename <- ""

  # Modify the phenotype table
  phe_table <- plinkr::read_plink_phe_file(gcae_input_filenames$phe_filename)
  new_phe_table <- phe_table[seq(1, 2), ]
  plinkr::save_phe_table(
    phe_table = new_phe_table,
    phe_filename = gcae_input_filenames$phe_filename
  )

  before <- summarise_gcae_input_files(gcae_input_filenames)

  resize_to_shared_individuals_from_files(gcae_input_filenames)

  after <- summarise_gcae_input_files(gcae_input_filenames)

  expect_true(any(as.integer(after) != as.integer(before)))


  file.remove(as.character(unlist(gcae_input_filenames)))
})
