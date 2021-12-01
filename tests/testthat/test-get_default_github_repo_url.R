test_that("use", {
  expect_equal(
    get_default_github_repo_url(),
    "https://github.com/richelbilderbeek/GenoCAE"
  )
})
