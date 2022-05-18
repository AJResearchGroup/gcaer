test_that("use", {
  train_opts_ids <- get_gcae_train_opts_ids()
  expect_equal(
    length(train_opts_ids),
    length(get_gcae_train_opts_filenames())
  )
  for (train_opts_id in train_opts_ids) {
    expect_silent(check_train_opts_id(train_opts_id))
  }
})

test_that("use on experimental train_optss", {
  # the 'Pheno' branch on github.com/richelbilderbeek/GenoCAE
  gcae_folder <- "~/GitHubs/gcae"
  if (!dir.exists(gcae_folder)) return()
  gcae_options <- create_gcae_options(gcae_folder = "~/GitHubs/gcae")
  train_opts_ids <- get_gcae_train_opts_ids(gcae_options = gcae_options)
  expect_equal(
    length(train_opts_ids),
    length(get_gcae_train_opts_filenames(gcae_options = gcae_options))
  )
  for (train_opts_id in train_opts_ids) {
    expect_silent(check_train_opts_id(train_opts_id))
  }
})

test_that("use", {
  train_opts_ids <- get_gcae_train_opts_ids(
    gcae_options = create_gcae_options(
      gcae_folder = get_gcaer_tempfilename()
    )
  )
  expect_equal(length(train_opts_ids), 0)
})
