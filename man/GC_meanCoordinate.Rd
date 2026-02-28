\name{GC_meanCoordinate}
\alias{GC_meanCoordinate}
\title{Add Mean Coordinates to a GC Chart}
\usage{
GC_meanCoordinate(
  GC_chart,
  group = NULL,
  genes = NULL,
  position = c("center", "start", "end"),
  axis = c("bottom", "top", "both"),
  cluster = NULL,
  ...
)
}
\arguments{
\item{GC_chart}{The GC chart object to be modified.}

\item{group}{Optional character; column containing gene identifiers.}

\item{genes}{Optional character vector of genes to include.}

\item{position}{Character; one of \code{"center"}, \code{"start"}, or \code{"end"}.}

\item{axis}{Character; one of \code{"bottom"}, \code{"top"}, or \code{"both"}.}

\item{cluster}{Optional cluster selection.}

\item{...}{Additional options forwarded to \code{GC_coordinates()}.}
}
\value{
Updated GC chart with mean coordinates.
}
\description{
Convenience wrapper around \code{GC_coordinates()} to render mean gene
coordinates as genomic ticks.
}
