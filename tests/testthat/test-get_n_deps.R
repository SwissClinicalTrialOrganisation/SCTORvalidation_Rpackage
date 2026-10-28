# package with a known DESCRIPTION in a temporary library
lib <- tempfile()
dir.create(file.path(lib, "fakepkg"), recursive = TRUE)
desc <- file.path(lib, "fakepkg", "DESCRIPTION")

test_that("Depends and Imports are counted, R itself is not", {
  writeLines(c("Package: fakepkg",
               "Depends: R (>= 4.0), dplyr",
               "Imports: purrr, stringr, tidyr"), desc)
  expect_equal(get_n_deps("fakepkg", lib.loc = lib), 4)
})

test_that("no dependencies gives 0", {
  writeLines("Package: fakepkg", desc)
  expect_equal(get_n_deps("fakepkg", lib.loc = lib), 0)
})
