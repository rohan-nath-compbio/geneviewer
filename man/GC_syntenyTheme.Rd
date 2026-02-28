\name{GC_syntenyTheme}
\alias{GC_syntenyTheme}
\title{Apply a Synteny Visualization Theme}
\usage{
GC_syntenyTheme(
  GC_chart,
  group = NULL,
  label = NULL,
  link_group = NULL,
  link_data = NULL,
  show_links = TRUE,
  measure = "identity",
  show_link_labels = FALSE,
  link_curve = TRUE,
  show_coordinates = TRUE,
  coordinate_summary = c("none", "mean", "median"),
  coordinate_position = c("center", "start", "end"),
  coordinate_axis = c("bottom", "top", "both"),
  genes_for_coordinates = NULL,
  show_legend = TRUE,
  legend_position = "bottom",
  colorScheme = "schemeTableau10",
  customColors = NULL,
  marker = "arrow",
  marker_size = "medium",
  separate_strands = FALSE,
  prevent_gene_overlap = TRUE,
  overlap_spacing = 6,
  strand_spacing = 8,
  cluster_style = list(backgroundColor = "#fcfcfd"),
  label_args = list(fontSize = "11px", cursor = "default"),
  coordinate_textStyle = list(fontSize = "10px", fill = "#333333"),
  coordinate_tickStyle = list(stroke = "#666666", strokeWidth = 1),
  link_style = list(fillOpacity = 0.35, stroke = "#8a8a8a", strokeWidth = 0.5),
  link_label_style = list(fontSize = "8px", fill = "#2b2b2b")
)
}
\arguments{
\item{GC_chart}{The GC chart object to be modified.}
\item{group}{Optional grouping column for gene colors and labels.}
\item{label}{Optional label column for \code{GC_labels()}.}
\item{link_group}{Optional grouping column used by \code{GC_links()}.}
\item{link_data}{Optional data.frame passed to \code{GC_links(data = ...)}.}
\item{show_links}{Logical; whether to render links.}
\item{measure}{Link measure for coloring/labeling.}
\item{show_link_labels}{Logical; whether to show link labels.}
\item{link_curve}{Logical; whether links are curved.}
\item{show_coordinates}{Logical; whether to show coordinates.}
\item{coordinate_summary}{One of \code{"none"}, \code{"mean"}, \code{"median"}.}
\item{coordinate_position}{One of \code{"center"}, \code{"start"}, \code{"end"}.}
\item{coordinate_axis}{One of \code{"bottom"}, \code{"top"}, \code{"both"}.}
\item{genes_for_coordinates}{Optional character vector of genes to summarize.}
\item{show_legend}{Logical; whether to show legend.}
\item{legend_position}{Legend position.}
\item{colorScheme}{D3 color scheme used for genes.}
\item{customColors}{Optional custom color mapping.}
\item{marker}{Gene marker shape.}
\item{marker_size}{Gene marker size.}
\item{separate_strands}{Logical; separate forward/reverse tracks.}
\item{prevent_gene_overlap}{Logical; split overlapping genes into tracks.}
\item{overlap_spacing}{Numeric overlap track spacing.}
\item{strand_spacing}{Numeric strand spacing.}
\item{cluster_style}{CSS-like list applied to cluster container style.}
\item{label_args}{Named list forwarded to \code{GC_labels()}.}
\item{coordinate_textStyle}{Named list forwarded as \code{textStyle}.}
\item{coordinate_tickStyle}{Named list forwarded as \code{tickStyle}.}
\item{link_style}{Named list forwarded as \code{linkStyle}.}
\item{link_label_style}{Named list forwarded as \code{labelStyle}.}
}
\value{
Updated GC chart with a synteny-oriented style stack.
}
\description{
High-level convenience helper to style a chart for synteny figures. It applies
coordinated defaults for genes, labels, tracks, coordinates, links, and legend.
}
