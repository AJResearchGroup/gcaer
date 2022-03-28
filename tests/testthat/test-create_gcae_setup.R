test_that("use", {
  datadir <- "my_datadir/"
  data <- "HumanOrigins249_tiny"
  superpops <- "path_to_labels_file.csv"
  model_id <- "M1"
  train_opts_id <- "ex3"
  data_opts_id <- "b_0_4"
  pheno_model_id <- "p2"
  superpops <- "path_to_superpops"
  trainedmodeldir <- paste0(get_gcaer_tempfilename(pattern = "ae_out"), "/")
  gcae_setup <- create_gcae_setup(
    datadir = datadir,
    data = data,
    superpops = superpops,
    model_id = model_id,
    train_opts_id = train_opts_id,
    data_opts_id = data_opts_id,
    pheno_model_id = pheno_model_id,
    trainedmodeldir = trainedmodeldir
  )
  expect_equal(datadir, gcae_setup$datadir)
  expect_equal(data, gcae_setup$data)
  expect_equal(superpops, gcae_setup$superpops)
  expect_equal(model_id, gcae_setup$model_id)
  expect_equal(train_opts_id, gcae_setup$train_opts_id)
  expect_equal(data_opts_id, gcae_setup$data_opts_id)
  expect_equal(pheno_model_id, gcae_setup$pheno_model_id)
  expect_equal(trainedmodeldir, gcae_setup$trainedmodeldir)
})
