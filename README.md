<p align="center">
  <img src="man/figures/logo.png" class="pkgdown-hide" height="150px" align="right">
  <h1><strong>geneviewer</strong> - Gene Cluster Visualizations in R</h1>
</p>

<!-- badges: start -->

[![R-CMD-check](https://github.com/nvelden/geneviewer/workflows/R-CMD-check/badge.svg)](https://github.com/nvelden/geneviewer/actions) [![CRAN status](https://www.r-pkg.org/badges/version/geneviewer)](https://CRAN.R-project.org/package=geneviewer) [![Metacran downloads](https://cranlogs.r-pkg.org/badges/grand-total/geneviewer)](https://cran.r-project.org/package=geneviewer) ![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

<!-- badges: end -->

## geneviewer

**geneviewer** is an R package for plotting gene clusters and transcripts. It imports data from GenBank, FASTA, and GFF files, performs BlastP and MUMmer alignments, and displays results on gene arrow maps. The package offers extensive customization options, including legends, labels, annotations, scales, colors, tooltips, and more. To explore all features visit the [package website](https://nvelden.github.io/geneviewer/articles/geneviewer.html).

## Interactive Shiny Dashboard

Try the **[Gene Cluster Dashboard](https://nvelden.github.io/geneviewer-shinylive/)** - a web interface that provides point-and-click access to geneviewer's visualization features. *(Allow 1-2 minutes for loading)*

**[Dashboard Repository](https://github.com/nvelden/geneviewer-shinylive)**



## Installation

You can install the released version of **geneviewer** from CRAN with:

```r
install.packages("geneviewer")
```

And the development version from GitHub with: 

``` r
# install.packages("devtools")
devtools::install_github("nvelden/geneviewer")
```

## Usage

The below example demonstrates using **geneviewer** to plot a gene cluster on a genomic sequence, using the start and end positions of each gene. The genes are grouped by class and labels are added using the `GC_labels` function.

``` r
library(geneviewer)

# Data
gene_cluster <- data.frame(
  name = c("ophB1", "ophC", "ophA", "ophD", "ophB2", "ophP", "ophE"),
  start = c(2522, 5286, 9536, 12616, 13183, 19346, 20170),
  end = c(4276, 4718, 10904, 11859, 15046, 16016, 21484),
  class = c("Monooxygenase", "NTF2-like", "Methyltransferase", 
  "O-acyltransferase", "Monooxygenase", "Prolyloligopeptidase", 
  "F-box/RNHI-like")
)

# Chart
GC_chart(gene_cluster, group = "class", height = "100px") %>%
  GC_labels("name")
```

<img src="man/figures/ophA_gene_cluster.png"/>

### Mean Gene Coordinates and Coordinate Styling

You can render summary coordinates (mean or median) for selected genes and control top/bottom axis aesthetics:

```r
GC_chart(gene_cluster, group = "class", height = "120px") %>%
  GC_coordinates(
    summary_fun = "mean",
    position = "center",
    genes = c("Monooxygenase", "Methyltransferase"),
    summary_axis = "bottom",
    showTop = FALSE,
    showBottom = TRUE,
    bottomTextAnchor = "end",
    bottomDx = 1.2,
    bottomDy = -0.2,
    bottomRotate = -30,
    textStyle = list(fontSize = "11px", fill = "#2f3e46"),
    tickStyle = list(stroke = "#52796f", strokeWidth = 1.2)
  )
```

### Synteny-Optimized Styling in One Call

Use `GC_syntenyTheme()` to apply a publication-ready synteny style stack:

```r
gene_cluster$cluster <- "Cluster 1"

GC_chart(gene_cluster, group = "class", cluster = "cluster", height = "220px") %>%
  GC_syntenyTheme(
    group = "class",
    link_group = "class",
    coordinate_summary = "mean",
    coordinate_axis = "bottom",
    show_link_labels = FALSE
  )
```

For mean coordinate ticks only, use the convenience wrapper:

```r
GC_chart(gene_cluster, group = "class", cluster = "cluster", height = "120px") %>%
  GC_meanCoordinate(group = "class", axis = "bottom")
```

## Run Tests Locally

If `Rscript` is available:

```bash
./scripts/run-tests.sh
```

If `Rscript` is missing, the same script automatically falls back to Docker (`rocker/r-ver:4.3.3`) when Docker is installed.

For fast synteny regression checks only:

```bash
./scripts/run-smoke-tests.sh
```

GitHub also runs these smoke checks on pull requests via `.github/workflows/synteny-smoke.yml`.

## Examples

For additional examples and the corresponding code to create the plots, please visit the [Examples](https://nvelden.github.io/geneviewer/articles/Examples.html) section.

<img src="man/figures/erythromycin_BlastP.png"/>

<hr>

<img src="man/figures/BRCA1_splice_variants.png"/>

<hr>

<img src="man/figures/MUMmer.png"/>

<hr>

<img src="man/figures/erythromycin_link.png"/>

<hr>

<img src="man/figures/ophA_clusters.png"/>

<hr>

<img src="man/figures/ophA_gene_links.png"/>

<hr>

<img src="man/figures/erythromycin_cluster.png"/>

<hr>

<img src="man/figures/human_hox_genes.png"/>

## Issues

If you encounter any issues or have feature requests, please open an [Issue](https://github.com/nvelden/geneviewer/issues).
