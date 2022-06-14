#' Rename multiple files
#'
#' Rename multiple files
#' @param filenames_from one or more filenames
#' @param filenames_to one or more filenames
#' @return nothing
#' @examples
#' # Rename one file, same as file.rename
#' tempfile_1 <- get_gcaer_tempfilename()
#' tempfile_2 <- get_gcaer_tempfilename()
#'
#' dir.create(dirname(tempfile_1), recursive = TRUE, showWarnings = FALSE)
#' file.create(tempfile_1)
#'
#' rename_files(
#'   filenames_from = tempfile_1,
#'   filenames_to = tempfile_2
#' )
#'
#' # Cleanup
#' unlink(dirname(tempfile_1), recursive = TRUE)
#' unlink(dirname(tempfile_2), recursive = TRUE)
#'
#' # Rename two files
#' tempfile_1 <- get_gcaer_tempfilename()
#' tempfile_2 <- get_gcaer_tempfilename()
#' tempfile_3 <- get_gcaer_tempfilename()
#' tempfile_4 <- get_gcaer_tempfilename()
#'
#' dir.create(dirname(tempfile_1), recursive = TRUE, showWarnings = FALSE)
#' dir.create(dirname(tempfile_2), recursive = TRUE, showWarnings = FALSE)
#' file.create(tempfile_1)
#' file.create(tempfile_2)
#'
#' rename_files(
#'   filenames_from = c(tempfile_1, tempfile_2),
#'   filenames_to = c(tempfile_3, tempfile_4)
#' )
#'
#' # Cleanup
#' unlink(dirname(tempfile_1), recursive = TRUE)
#' unlink(dirname(tempfile_2), recursive = TRUE)
#' unlink(dirname(tempfile_3), recursive = TRUE)
#' unlink(dirname(tempfile_4), recursive = TRUE)
#' @author Richèl J.C. Bilderbeek
#' @export
rename_files <- function(
  filenames_from,
  filenames_to
) {
  testthat::expect_equal(length(filenames_from), length(filenames_from))
  testthat::expect_true(length(filenames_from) > 0)
  testthat::expect_true(is.character(filenames_from))
  testthat::expect_true(is.character(filenames_to))
  testthat::expect_true(all(nchar(filenames_from) > 0))
  testthat::expect_true(all(nchar(filenames_to) > 0))
  testthat::expect_equal(
    length(unique(filenames_from)),
    length(filenames_from)
  )
  testthat::expect_equal(
    length(unique(filenames_to)),
    length(filenames_to)
  )
  testthat::expect_equal(0, sum(filenames_from %in% filenames_to))
  testthat::expect_equal(0, sum(filenames_to %in% filenames_from))
  testthat::expect_true(all(file.exists(filenames_from)))
  for (i in seq_along(filenames_from)) {
    file.rename(
      from = filenames_from[i],
      to = filenames_to[i]
    )
  }
}
