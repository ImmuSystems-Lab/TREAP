#' A treap function
#'
#' This function calculates betweenness values of a PPI+PGI network, which is 
#' obtained from combining protein-protein interactions, or PPIs, and protein-gene 
#' interactions, or PGIs. Interactions with genes not available in adjusted p-values 
#' will be removed.
#' 
#' @param ppi A two-column matrix of PPIs. Each row contains the two nodes of an interaction entry.
#' @param pgi A two-column matrix of PGIs. Each row contains the two nodes of an interaction entry.
#' @param genesym A vector of all genes in adjusted p-values.
#' @keywords 
#' @export 
#' @examples
#' btw_pro()

btw_pro = function(ppi, pgi, genesym){
  
  network = rbind(ppi, pgi)
  genesym = toupper(genesym)
  
  # remove interactions with genes not in adjusted p-values
  p1 = toupper(as.character(network[,1]))
  ind = p1 %in% genesym
  network = network[ind,]
  p2 = toupper(as.character(network[,2]))
  ind = p2 %in% genesym
  network = network[ind,]
  # sort protein 1 & 2 in each row
  network.sort = apply(network,1,function(x){
    x[order(x)]
  })
  network.sort = t(network.sort)
  # remove duplicated interactions
  network.uni = network.sort[!duplicated(network.sort),]
  # transform into igraph object
  # regard them as indirected interactions when computing betweenness
  net.graph = igraph::graph_from_data_frame(network.uni,
                                            directed=F)
  # calculate btw
  btw = igraph::betweenness(net.graph, directed=F)
  
  return(btw)
}
