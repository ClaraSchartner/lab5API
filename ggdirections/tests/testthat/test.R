x <- directions("Vienna", "Graz")
#y <- directions("Bangkok", "Pattaya", avoid="tolls")
#z <- directions("Manchester", "Leeds", travel_mode="walking")

test_that("the return value has the correct class",{
    expect_equal(class(x), c("gg", "ggplot"))
})
#
test_that("does not throw error for erronous input",{
  expect_error(directions("Washington","Quito"))
})
