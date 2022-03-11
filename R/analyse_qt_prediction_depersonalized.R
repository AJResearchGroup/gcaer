#' Determine how well the quantitative trait prediction worked
#'
#' @inheritParams default_params_doc
#' @return Nothing. Will create some files.
#' @author Richèl J.C. Bilderbeek
#' @export
analyse_qt_prediction_depersonalized <- function(
  datadir,
  trainedmodeldir,
  png_filename,
  verbose = FALSE
) {
  gcaer::analyse_qt_prediction(
    datadir = datadir,
    trainedmodeldir = trainedmodeldir,
    png_filename = png_filename,
    verbose = verbose
  )
}
