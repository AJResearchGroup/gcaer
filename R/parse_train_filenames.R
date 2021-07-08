#' Parse the data from the files produced by \link{gcae_train}
#'
#' Parse the data from the files produced by \link{gcae_train}
#' @inheritParams default_params_doc
#' @return a list of tibbles
#'  * `train_times`: time in seconds to train each epoch
#'  * `losses_from_train_t`: loss function value on the training set per epoch
#'  * `losses_from_train_v`: loss function value on the validation set per epoch
#' @author Richèl J.C. Bilderbeek
#' @export
parse_train_filenames <- function(train_filenames) {
  train_times_filename <- stringr::str_subset(
    train_filenames, "train_times\\.csv$"
  )
  losses_from_train_t_filename <- stringr::str_subset(
    train_filenames, "losses_from_train_t\\.csv$"
  )
  losses_from_train_v_filename <- stringr::str_subset(
    train_filenames, "losses_from_train_v\\.csv$"
  )
  train_times_table <- gcaer::parse_train_times_file(
    train_times_filename
  )
  losses_from_train_t_table <- gcaer::parse_losses_from_train_t_file(
    losses_from_train_t_filename
  )
  losses_from_train_v_table <- gcaer::parse_losses_from_train_v_file(
    losses_from_train_v_filename
  )
  list(
    train_times_table = train_times_table,
    losses_from_train_t_table = losses_from_train_t_table,
    losses_from_train_v_table = losses_from_train_v_table
  )
}
