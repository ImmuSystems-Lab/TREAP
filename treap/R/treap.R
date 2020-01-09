#' A treap function
#'
#' This function calculates TREAP scores for each gene given adjusted p-values from 
#' drug treated gene expression profiles and betweenness values from a network of 
#' protein-protein interactions, or PPIs, and protein-gene interactions, or PGIs. 
#' Genes with higher scores are more likely to be targets of associated drugs.
#' 
#' @param adj A matrix of djusted p-values. The column names refer to samples to be analyzed, and the row names refer to genes.
#' @param btw A vector of PPI+PGI betweenness. The names of btw should be the same type of gene IDs with adj, but don't have to be in the same order.
#' @keywords 
#' @export 
#' @examples
#' treap()

treap = function(adj, btw){
  
  # rank adj and give scores
  score1 = apply(adj, 2, rank_pro, direction="small")
  
  # gene ids
  geneid = rownames(adj)
  # match btw genes to gene ids of adj
  ind = match(toupper(names(btw)), toupper(geneid))
  # matched betweenness
  btw.matched = rep(0, length(geneid))
  btw.matched[ind] = btw
  # rank matched btw
  score2 = rank_pro(x=btw.matched, direction="large")
  
  # sum up scores
  treap.score = score1 + score2
  
  return(treap.score)
}
