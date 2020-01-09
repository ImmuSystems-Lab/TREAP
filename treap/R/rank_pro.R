#' A treap function
#'
#' This function allows customized sorting and returns the ranks of values in a 
#' vector. Same values will have the same ranks. 
#' @param x A numeric vector.
#' @param direction This defines the sorting order. For "large", larger values in x will have higher ranks. For "small", smaller values in x will have higher ranks.
#' @keywords 
#' @export
#' @examples
#' rank_pro()

rank_pro = function(x, direction){
  
  if (direction=="large"){
    # larger values in x will have higher ranks
    r = rank(x, na.last = T, ties.method = "min")
    
  } else if (direction=="small"){
    # smaller values in x will have higher ranks
    r = rank(-x, na.last = T, ties.method = "max")
    
  } else {
    print("The direction is unclear")
  }
  
  return(r)
}
