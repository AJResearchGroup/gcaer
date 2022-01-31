test_that("use", {
  data_opts_id <- "b_0_4"
  gcae_options <- create_gcae_options()
  gcae_data_opts_filename <- get_gcae_data_opts_filename(
    data_opts_id = data_opts_id,
    gcae_options = gcae_options
  )
  expect_true(
    stringr::str_detect(
      gcae_data_opts_filename,
      pattern = paste0(data_opts_id, "\\.json$")
    )
  )
})
