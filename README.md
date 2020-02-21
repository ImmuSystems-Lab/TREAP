# TREAP version 1.0
**T**arget inference by **r**anking b**e**tweenness and **a**djusted ***p***-values

The R package of TREAP (v.1.0) has been successfully tested on the R (3.5.2) platform. Please refer to the manuscript for more detailed information about the algorithm (link: https://www.biorxiv.org/content/10.1101/2020.01.17.910885v1). Any questions regarding TREAP usage can be addressed to jason.shoemaker@pitt.edu or to muw2@pitt.edu.

# Installation

1. The R package `devtools` is required to install treap from github repository.
2. Run the following codes to download and install treap: `devtools::install_github("ImmuSystems-Lab/TREAP/treap")`.
3. Use `library(treap)` to check installation and load the package.

# Prepare inputs for TREAP

TREAP needs protein-protein interactions (PPIs), protein-gene interactions (PGIs) and adjusted *p*-values from gene expression profiles to predict drug targets. Below is the example data in the `treap` package:

`adj_dp14`: Adjusted *p*-values obtained from DP14 gene expression profiles, pre-processed as described in the manuscript

`ppi.hm`: Human PPIs from the STRING database

`pgi.b`: Human PGIs of 'lymphocytes of B lineage' from the Regulatory Circuits database

`genesym`: The gene IDs referring to all genes in the matrix of `adj_dp14`


By the function named btw_pro, users can calculate the betweenness values of the PPI+PGI network. Interactions with proteins or genes not unavailable in the adjusted p-values will be removed.

The treap function requires the matrix of adjusted *p*-values and betweenness values obtained from btw_pro to calculate the score of each gene in the adjusted p-values.

# Predict drug targets by TREAP

