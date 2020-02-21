# TREAP version 1.0
**T**arget inference by **r**anking b**e**tweenness and **a**djusted ***p***-values

The R package of TREAP (v.1.0) has been successfully tested on the R (3.5.2) platform. Please refer to the manuscript for more detailed information about the algorithm (link: https://www.biorxiv.org/content/10.1101/2020.01.17.910885v1). Any questions regarding TREAP usage can be addressed to jason.shoemaker@pitt.edu or to muw2@pitt.edu.

## Installation

1. The R package `devtools` is required to install treap from github repository.
2. Run the following codes to download and install treap: `devtools::install_github("ImmuSystems-Lab/TREAP/treap")`.
3. Use `library(treap)` to check installation and load the package.

## Predict drug targets by TREAP

TREAP needs protein-protein interactions (PPIs), protein-gene interactions (PGIs) and adjusted *p*-values from gene expression profiles to predict drug targets. Below is the example data in the `treap` package:

`adj_dp14`: Adjusted *p*-values obtained from DP14 gene expression profiles [1], pre-processed as described in the manuscript

`ppi.hm`: Human PPIs from the STRING database [2]

`pgi.b`: Human PGIs of 'lymphocytes of B lineage' from the Regulatory Circuits database [3]

`genesym`: The gene IDs referring to all genes in the matrix of `adj_dp14`


By the function `btw_pro`, users can calculate the betweenness values of the PPI+PGI network. Interactions with proteins or genes unavailable in the adjusted *p*-values will be removed.

```{r warning=FALSE,eval=FALSE,echo=TRUE}
ppipgi.btw = btw_pro(ppi=ppi.hm, pgi=pgi.b, genesym=genesym)
```

The function `treap` requires the matrix of adjusted *p*-values and betweenness values obtained from `btw_pro`, e.g. `ppipgi.btw`, to calculate the score of each gene in the adjusted p-values. Genes with higher scores are more likely to be targets of associated drugs.

```{r warning=FALSE,eval=FALSE,echo=TRUE}
scores = treap(adj = adj_dp14, btw = ppipgi.btw)
```

## References:

[1] Bansal, M., et al., A community computational challenge to predict the activity of pairs of compounds. Nat Biotechnol, 2014. 32(12): p. 1213-22.

[2] Szklarczyk, D., et al., STRING v11: protein-protein association networks with increased coverage, supporting functional discovery in genome-wide experimental datasets. Nucleic Acids Res, 2019. 47(D1): p. D607-D613.

[3] Marbach, D., et al., Tissue-specific regulatory circuits reveal variable modular perturbations across complex diseases. Nat Methods, 2016. 13(4): p. 366-70.
