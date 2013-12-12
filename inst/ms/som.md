<!--% redefine the command that creates the Table number.-->
\renewcommand{\thetable}{S\arabic{table}}
\setcounter{table}{0}

<!--% redefine the command that creates the Figure number.-->
\renewcommand{\thefigure}{S\arabic{figure}}
\renewcommand{\figurename}{Fig.}
\setcounter{figure}{0}

# Supplementary Information #

## Supplementary code ##

The `metafolio` `R` package contains the functions and code to carry out the analyses in our paper.
In an `R` console (version $\ge 3.0.0$), you can install `metafolio` by first setting your working directory with `setwd()` to wherever you saved the package and then running:

```
# Install dependencies:
install.packages(c("plyr", "colorspace"))

# Install the package:
install.packages("metafolio_0.3.0.tar.gz", repos = NULL, type = "source")

# Then load the package:
library(metafolio)
```

The included vignette describes the package and illustrates some example simulations.
You can view the vignette with:

```
vignette("metafolio")
```

You can view the help for the package with:

```
?metafolio
```

The figures from this paper can be re-created by sourcing the file `README.R` in the `inst/examples` folder:

```
setwd("metafolio/inst/examples")
source("README.R")
```

Note that the simulations will take awhile to run (approximately 5--20 minutes given current CPU speeds).

\clearpage

## Supplementary tables ##

\input{tables}

## Supplementary figures ##


<!--\begin{figure}[htbp]-->
<!--\centering-->
<!--\includegraphics[width=4.5in]{../examples/thermal-curves.pdf}-->
<!--\caption{The full range of environmental tolerance curves shown for 10 -->
<!--populations. The vertical dotted lines indicate the general range of -->
<!--environmental fluctuations in the main simulations, and the vertical dashed -->
<!--line indicates the mean environmental value in the main simulations.}-->
<!--\label{f:all-curves}-->
<!--\end{figure}-->
<!--\clearpage-->

\begin{figure}[htbp]
\centering
\includegraphics[width=3.5in]{stray-matrix}
\caption{An example straying matrix. The rows and columns represent different
populations (indicated by population number). Dark blue indicates a high rate
of straying and light blue indicates a low rate of straying.}
\label{f:stray}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.0in]{plot-various-options-ts-3pops}
\caption{The impact of increasing or decreasing various parameter values on
metapopulation return abundance. The different coloured lines represent three
example salmon populations. The base case represents the base-case values for
the short-term environmental fluctuation scenario.}
\label{f:eg-sens}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.5in]{spatial-arma-sim-full}
\caption{Conserving a \textbf{full range} of response diversity (spatial
conservation strategy) with \textbf{short-term} environmental fluctuations.}
\label{f:eg-sp-arma-full}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.5in]{spatial-arma-sim-onehalf}
\caption{Conserving \textbf{one half} of response diversity (spatial
conservation strategy) with \textbf{short-term} environmental fluctuations.}
\label{f:eg-sp-arma-half}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.5in]{example-return-correlations}
\caption{A comparison of the log(returns) between populations. The
subpopulation IDs are coloured from warm tolerant (warm colours) to cool
tolerant (cool colours). Note how populations 1 and 10 have asynchronous
returns whereas populations with more similar thermal-tolerance curves (say
populations 9 and 10) have more synchronous dynamics. Populations with
thermal tolerance curves in the middle (e.g. population 6) are less
correlated with other populations. Their population dynamics end up primarily
driven by demographic stochasticity and less so by temperature-induced
systematic changes in productivity.}
\label{f:ret-corr}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.5in]{spatial-linear-sim-full}
\caption{Conserving a \textbf{full range} of response diversity (spatial
conservation strategy) with \textbf{long-term} environmental fluctuations.}
\label{f:eg-sp-linear-full}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.5in]{spatial-linear-sim-onehalf}
\caption{Conserving \textbf{one half} of response diversity (spatial
conservation strategy) with \textbf{long-term} environmental fluctuations.}
\label{f:eg-sp-linear-half}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.5in]{n-arma-sim-2}
\caption{\textbf{Two populations} conserved with random response diversity and
\textbf{short-term} environmental fluctuations.}
\label{f:eg-n-arma-two}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.5in]{n-arma-sim-16}
\caption{\textbf{Sixteen populations} conserved with random response diversity
and \textbf{short-term} environmental fluctuations.}
\label{f:eg-n-arma-sixteen}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.5in]{n-linear-sim-2}
\caption{\textbf{Two populations} conserved with random response diversity and
\textbf{long-term} environmental change.}
\label{f:eg-n-linear-two}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.5in]{n-linear-sim-16}
\caption{\textbf{Sixteen populations} conserved with random response diversity
and \textbf{long-term} environmental change.}
\label{f:eg-n-linear-sixteen}
\end{figure}
