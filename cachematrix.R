## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


#make the special matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  #i for inverse property
  i <- NULL
  #set the matrix
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  #function to get the matrix
  get <- function() x
  
  ##set inverse matrix
  setinverse <- function(inverse) 
  {
    i <<- inverse
  }
  #get inverse matrix
  getinverse <- function()
  { 
    i
  }
  #return the methods list
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse) 

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  mat <- x$getinverse()
  if (!is.null(mat)) {
    message("getting from cache")
    return(mat)
  }
  #get mat
  data <- x$get()
  ##calculate inverse
  mat <- solve(data, ...)
  ##set inverse
  x$setinverse(mat)
  mat
  }
## test the code
m <- matrix(c(1,2,3,4),2,2)
m
m_inv <- makeCacheMatrix(m)
cacheSolve(m_inv)



