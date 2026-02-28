test_that("smoke: mean coordinate wrapper returns expected ticks", {
  genes_data <- data.frame(
    start = c(1, 11, 101, 121),
    end = c(5, 15, 109, 129),
    gene = c("A", "A", "A", "A"),
    cluster = c("c1", "c1", "c2", "c2")
  )

  chart <- GC_chart(genes_data, group = "gene", cluster = "cluster")
  out <- GC_meanCoordinate(chart, group = "gene", axis = "bottom")

  expect_equal(out$x$series$c1$coordinates$tickValuesBottom, 8)
  expect_equal(out$x$series$c2$coordinates$tickValuesBottom, 115)
})

test_that("smoke: synteny theme applies links and coordinates", {
  genes_data <- data.frame(
    start = c(10, 40, 80, 12, 42, 82),
    end = c(25, 55, 95, 27, 57, 97),
    gene = c("A", "B", "C", "A", "B", "C"),
    identity = c(NA, NA, NA, 95, 80, 75),
    similarity = c(NA, NA, NA, 90, 70, 65),
    cluster = c("c1", "c1", "c1", "c2", "c2", "c2")
  )

  chart <- GC_chart(genes_data, group = "gene", cluster = "cluster")
  out <- GC_syntenyTheme(
    chart,
    group = "gene",
    link_group = "gene",
    coordinate_summary = "mean",
    coordinate_axis = "bottom"
  )

  expect_true(length(out$x$links) > 0)
  expect_true(length(out$x$series$c1$coordinates$tickValuesBottom) > 0)
  expect_equal(out$x$series$c1$genes$marker, "arrow")
})
