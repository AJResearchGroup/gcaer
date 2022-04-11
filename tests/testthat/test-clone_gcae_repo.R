test_that("can clone the GCAE repo", {
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  expect_silent(clone_gcae_repo(gcae_options))
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})

test_that("can clone the GCAE repo verbosely", {
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  suppressMessages(
    expect_message(clone_gcae_repo(gcae_options, verbose = TRUE))
  )
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})
test_that("cannot clone the GCAE repo twice", {
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  expect_silent(clone_gcae_repo(gcae_options))
  expect_error(
    clone_gcae_repo(gcae_options),
    "GCAE repo already has been cloned"
  )
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})
