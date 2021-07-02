#' Run TensorBoard
#'
#' Run TensorBoard by starting a web server.
#' Never run this from RStudio, as this will cause a freeze
#' @param logdir the directory that contains the TensorFlow log.
#' `logdir` is named after the TensorBoard `--logdir` CLI flag
#' @author Richèl J.C. Bilderbeek
#' @export
run_tensorboard <- function(
  logdir
) {
  system2(
    command = "tensorboard",
    args = c("--logdir", logdir)
  )
}
