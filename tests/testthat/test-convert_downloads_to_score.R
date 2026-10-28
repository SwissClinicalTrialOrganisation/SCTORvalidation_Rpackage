# score = 1.5 / (downloads / 100000 + 1.5)
test_that("download score by hand", {
  expect_equal(convert_downloads_to_score(0), 1) # 1.5 / 1.5
  expect_equal(convert_downloads_to_score(100000), 0.6) # 1.5 / 2.5
  expect_equal(convert_downloads_to_score(150000), 0.5)
  expect_equal(convert_downloads_to_score(600000), 0.2) # 1.5 / 7.5
  # missing counts as 0 downloads
  expect_equal(convert_downloads_to_score(NA), 1)
})
