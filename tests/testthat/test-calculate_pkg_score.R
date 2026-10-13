# mean of 10 components: 8 answers (0, 0.5 or 1), dependency and download score
# <= 0.25 Low, <= 0.75 Medium, above High

test_that("best case", {
  # only the download score (0.5) is not 0
  score <- pkg_score()
  expect_equal(score$final_score, 0.05)
  expect_equal(as.character(score$final_score_cat), "Low")
})

test_that("worst case", {
  # 8 answers at 1, 25 dependencies (0.9999687), no downloads (1)
  score <- pkg_score(author = "No clear credentials or group association",
                     maintainer = "Unavailable",
                     purpose = "Statistical; non-published",
                     dependencies = "25",
                     on_cran = "No",
                     code_documented = "No",
                     downloads = "0",
                     bug_reporting = "No",
                     vignettes = "No",
                     tests = "No")
  expect_equal(score$final_score, 0.9999969, tolerance = 1e-6)
  expect_equal(as.character(score$final_score_cat), "High")
})

test_that("Medium near the limits", {
  # 1 + 0.5 + 0.5 + 0.5 + downloads 0.2 = 2.7
  score <- pkg_score(maintainer = "Unavailable",
                     author = "Credentials",
                     purpose = "Statistical; published",
                     tests = "Yes, but not comprehensive",
                     downloads = "600000")
  expect_equal(score$final_score, 0.27)
  expect_equal(as.character(score$final_score_cat), "Medium")

  # 7 answers at 1 + downloads 0.2 = 7.2
  score <- pkg_score(author = "No clear credentials or group association",
                     maintainer = "Unavailable",
                     purpose = "Statistical; non-published",
                     on_cran = "No",
                     code_documented = "No",
                     bug_reporting = "No",
                     vignettes = "No",
                     downloads = "600000")
  expect_equal(score$final_score, 0.72)
  expect_equal(as.character(score$final_score_cat), "Medium")
})

test_that("dplyr 1.2.0 as in issue #178", {
  # 13 dependencies (0.9875261), 19709355 downloads (0.0075531), rest 0: 0.0995079
  # the platform reported 0.1, Low
  score <- pkg_score(dependencies = "13", downloads = "19709355")
  expect_equal(round(score$final_score, 3), 0.1)
  expect_equal(as.character(score$final_score_cat), "Low")
})
