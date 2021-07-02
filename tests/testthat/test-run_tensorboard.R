test_that("use", {
  if (is_tensorboard_installed()) {
    run_tensorboard(
      logdir = "~/.local/share/gcaer/gcae_v1_0/ae_out/ae.M1.ex3.b_0_4.HumanOrigins249_tiny" # nolint indeed a long folder name
    )
  }
})
