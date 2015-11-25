
## The makeCacheMatrix() and cacheSolve() functions help us in computing the 
## inverse of a given matrix. If the inverse of a given input matrix is
## already present, it is returned from the cache without any recalculation,
## thereby saving computation time


## The "makeCacheMatrix" function creates a special matrix which is a list
## which contains getter and setter functions for both input and inverse matrices.
## 1) The get() function is used to obtain the input matrix 
## 2) The set() function is used to set the input matrix values and to clear the 
## previous inverse matrix
## 3) The getInv() function reutrns the computed Inverse matrix
## 4) The setInv() function sets the value of the Inverse matrix computation

makeCacheMatrix <- function(x = matrix()) {
    mat <- NULL
    
    set <- function(y) {
      x <<- y
      mat <<- NULL
    }
    
    get <- function() x
    setInv <- function(solve) mat <<- solve
    getInv <- function() mat
    list(set=set,get=get,setInv=setInv,getInv=getInv)
}


## The cacheSolve function receives the special matrix and checks if
## the inverse computation for the input had been done previously. If so,
## It is returned from cache; Else, the inverse is computed by solve()
## function and is set using the setInv() function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    mat <- x$getInv()
    
    if(!is.null(mat)){
      message("Matrix is returned from cache")
      return(mat)
    }
    
    data<-x$get()
    mat <- solve(data, ...)
    x$setInv(mat)
    mat
}
