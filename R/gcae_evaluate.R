#' Use `GCAE` its evaluate
#' @author Richèl J.C. Bilderbeek
#' @export
gcae_evaluate <- function(
  gcae_setup,
  gcae_options,
  verbose = FALSE
) {
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_gcae_options(gcae_options)
  args <- gcaer::create_gcae_evaluate_args(
    gcae_setup = gcae_setup,
    gcae_options = gcae_options
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
