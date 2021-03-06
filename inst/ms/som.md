<!--% redefine the command that creates the Table number.-->
\renewcommand{\thetable}{B\arabic{table}}
\renewcommand{\tablename}{\textsc{Table}}
\setcounter{table}{0}

<!--% redefine the command that creates the Figure number.-->
\renewcommand{\thefigure}{S\arabic{figure}}
\renewcommand{\figurename}{\textsc{Fig.}}
\setcounter{figure}{0}

# Appendices

## Portfolio conservation of metapopulations under climate change

Sean C. Anderson, Jonathan W. Moore, Michelle M. McClure, Nicholas K. Dulvy, Andrew B. Cooper

\bigskip

\textsc{Appendix A.} The `metafolio` \textsf{R} package.

\bigskip


The `metafolio` \textsf{R} package contains the functions and code to carry out the analyses in our paper.
`metafolio`. 
The package can be installed from CRAN with:

```
install.packages("metafolio")
```

Alternatively, you can view the code and install the package from `http://github.com/seananderson/metafolio`.

The included vignette describes the package and illustrates some example simulations.
You can view the vignette with:

```
vignette("metafolio")
```

You can view the help for the package with:

```
?metafolio
help(package = "metafolio")
```

The figures from this paper can be re-created by downloading the code from GitHub and sourcing the file `README.R` in the `inst/examples` folder:

```
setwd("metafolio/inst/examples")
source("README.R")
```

\clearpage

\textsc{Appendix B.} Simulation input parameters and default values.

\input{tables}

\textsc{Appendix C.} An example straying matrix.

\renewcommand{\thefigure}{C\arabic{figure}}
\setcounter{figure}{0}

\begin{figure}[htbp]
\centering
\includegraphics[width=3.5in]{../examples/stray-matrix}
\caption{An example straying matrix. The rows and columns represent different
populations (indicated by population number). Dark blue indicates a high rate
of straying and light blue indicates a low rate of straying.}
\label{f:stray}
\end{figure}
\clearpage

\textsc{Appendix D.} Sensitivity illustration with alternative parameter values.
\renewcommand{\thefigure}{D\arabic{figure}}
\setcounter{figure}{0}

\begin{figure}[htbp]
\centering
\includegraphics[width=3.5in]{../examples/plot-various-options-ts-3pops}
\caption{The impact of increasing or decreasing various parameter values on
metapopulation return abundance. The different coloured lines represent three
example salmon populations. The base case represents the base-case values for
the short-term environmental fluctuation scenario.}
\label{f:eg-sens}
\end{figure}
\clearpage

\textsc{Appendix E.} An illustration of the correlation between populations.
\renewcommand{\thefigure}{E\arabic{figure}}
\setcounter{figure}{0}

\begin{figure}[htbp]
\centering
\includegraphics[width=4.5in]{../examples/example-return-correlations}
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

\textsc{Appendix F.} Example simulated time series from alternative conservation scenarios.
\renewcommand{\thefigure}{F\arabic{figure}}
\setcounter{figure}{0}

<!--TODO - this should be removed - it duplicates a main text fig-->
\begin{figure}[htbp]
\centering
\includegraphics[width=4.3in]{../examples/spatial-arma-sim-full-colour}
\caption{Conserving a \textbf{full range} of response diversity (spatial
conservation strategy) with \textbf{short-term} environmental fluctuations. This is the same as Fig.~3 but in colour.}
\label{f:eg-sp-arma-full}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.3in]{../examples/spatial-arma-sim-onehalf}
\caption{Conserving \textbf{one half} of response diversity (spatial
conservation strategy) with \textbf{short-term} environmental fluctuations.}
\label{f:eg-sp-arma-half}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.3in]{../examples/spatial-linear-sim-full}
\caption{Conserving a \textbf{full range} of response diversity (spatial
conservation strategy) with \textbf{long-term} environmental change.}
\label{f:eg-sp-linear-full}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.3in]{../examples/spatial-linear-sim-onehalf}
\caption{Conserving \textbf{one half} of response diversity (spatial
conservation strategy) with \textbf{long-term} environmental change.}
\label{f:eg-sp-linear-half}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.3in]{../examples/n-arma-sim-2}
\caption{\textbf{Two populations} conserved with random response diversity and
\textbf{short-term} environmental fluctuations.}
\label{f:eg-n-arma-two}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.3in]{../examples/n-arma-sim-16}
\caption{\textbf{Sixteen populations} conserved with random response diversity
and \textbf{short-term} environmental fluctuations.}
\label{f:eg-n-arma-sixteen}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.3in]{../examples/n-linear-sim-2}
\caption{\textbf{Two populations} conserved with random response diversity and
\textbf{long-term} environmental change.}
\label{f:eg-n-linear-two}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.3in]{../examples/n-linear-sim-16}
\caption{\textbf{Sixteen populations} conserved with random response diversity
and \textbf{long-term} environmental change.}
\label{f:eg-n-linear-sixteen}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.3in]{../examples/n-linear-arma-sim-2-squeeze}
\caption{\textbf{Two populations} conserved with random response diversity
and \textbf{long-term declining stream flow}.}
\label{f:eg-n-squeeze-two}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.3in]{../examples/n-linear-arma-sim-16-squeeze}
\caption{\textbf{Sixteen populations} conserved with random response diversity
and \textbf{long-term declining stream flow}.}
\label{f:eg-n-squeeze-twelve}
\end{figure}

