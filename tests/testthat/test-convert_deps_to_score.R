
# s = 1 / (1 + exp(-0.5 * (deps - 4))), rescaled so that 0 deps give 0
# s(0) = 0.1192029
test_that("values checked by hand", {
  expect_equal(convert_deps_to_score(0), 0)
  # (0.5 - 0.1192029) / (1 - 0.1192029)
  expect_equal(convert_deps_to_score(4), 0.4323324, tolerance = 1e-6)
  # (0.8807971 - 0.1192029) / (1 - 0.1192029)
  expect_equal(convert_deps_to_score(8), 0.8646647, tolerance = 1e-6)
  expect_equal(convert_deps_to_score(100), 1)
})
