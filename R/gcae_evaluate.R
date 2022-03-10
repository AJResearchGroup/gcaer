#' Use `GCAE` its evaluate
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
gcae_evaluate <- function(
  gcae_setup,
  gcae_options,
  metrics,
  epoch,
  verbose = FALSE
) {
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_gcae_options(gcae_options)
  gcaer::check_metrics(metrics)
  gcaer::check_epoch(epoch)
  args <- gcaer::create_gcae_evaluate_args(
    gcae_setup = gcae_setup,
    metrics = metrics,
    epoch = epoch
  )
  if (verbose) {
    message(
      "Running GCAE with arguments: '", paste0(args, collapse = " "), " \n",
      "Tip: you should be able to copy-paste this :-)"
    )
  }
  output <- gcaer::run_gcae(
    args = args,
    gcae_options = gcae_options,
    verbose = verbose
  )
  if (verbose) {
    message("GCAE output: \n", paste0(output, collapse = "\n"))
  }
  "TODO"
}
