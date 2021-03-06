
test_that("We can extract a bracket from a simulation", {
  f <- system.file('kaggle_data/SampleSubmission.csv', package = "kaggleNCAA", mustWork=TRUE)
  dat <- parseBracket(f)
  year = sort(unique(dat$season))[1]
  sim <- simTourney(dat, 1, year, progress=FALSE)
  bracket <- extractBracket(sim, restrict=TRUE)
  expect_is(bracket, 'data.table')
  expect_gt(nrow(bracket), 63)
  bracket <- extractBracket(sim, restrict=FALSE)
  expect_is(bracket, 'data.table')
  expect_gt(nrow(bracket), 63)
})
