## These functions calculate the inverse of a matrix and  returns it or 
## resturns the cached value of the matrix if it already exists

## makeCacheMatrix() creates a matrix

makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        set <- function(y) {
                x <<- y
                inverse <<- NULL
        }
        get <- function() x
        setInverse <- function(inv) inverse <<- inv
        getInverse <- function() inverse
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}

## cacheSolve() returns the cached inverse of the matrix if it already exists
## or calculates and returns it it doesn't

cacheSolve <- function(x, ...) {
        inverse <- x$getInverse()
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        data <- x$get()
        inverse <- solve(data, ...)
        x$setInverse(inverse)
        inverse
}
