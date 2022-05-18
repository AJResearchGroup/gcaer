test_that("use", {
  data_opts_ids <- get_gcae_data_opts_ids()
  expect_equal(
    length(data_opts_ids),
    length(get_gcae_data_opts_filenames())
  )
  for (data_opts_id in data_opts_ids) {
    expect_silent(check_data_opts_id(data_opts_id))
  }
})

test_that("use on experimental data_optss", {
  # the 'Pheno' branch on github.com/richelbilderbeek/GenoCAE
  gcae_folder <- "~/GitHubs/gcae"
  if (!dir.exists(gcae_folder)) return()
  gcae_options <- create_gcae_options(gcae_folder = "~/GitHubs/gcae")
  data_opts_ids <- get_gcae_data_opts_ids(gcae_options = gcae_options)
  expect_equal(
    length(data_opts_ids),
    length(get_gcae_data_opts_filenames(gcae_options = gcae_options))
  )
  for (data_opts_id in data_opts_ids) {
    expect_silent(check_data_opts_id(data_opts_id))
  }
})

test_that("use", {
  data_opts_ids <- get_gcae_data_opts_ids(
    gcae_options = create_gcae_options(
      gcae_folder = get_gcaer_tempfilename()
    )
  )
  expect_equal(length(data_opts_ids), 0)
})
