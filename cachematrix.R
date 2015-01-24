## Created: 2014/01/15
## By: Greg Sanders
## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than computing it repeatedly.
## Through lexical scoping, the CachedMatrix essentially acts as an object for
## storage of a matrix.
## There are two direct functions. makeCacheMatrix which is used to initialize
## the matrix and cacheSolve which is used to calculate the inverse of 'x'
## My default preference would be to actually do the null checking in getinverse.
## but I figure keep it straightforward for peer review purposes.




## This function creates a special "matrix" object that can cache its inverse.
# It returns four functions.
# set, which can be used to assign a new matrix value.
# get, which returns the current matrix value.
# setinverse which caches the inverse value
# and get inverse which returns the inverse, 
makeCacheMatrix <- function(x = matrix()) {
        
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function() i <<- solve(x)
        getinverse <- function(){ i           
        }
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
        
        
}



## cacheSolve is just a wrapper for getinverse
## it must be passed an object generated using makeCacheMatrix.
## I'm not putting in any input protection, because thats outside what we were asked to do.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        x$getinverse()
}

# Here's a sample implementation
# testmatrix<-rnorm(5*5)
# dim(testmatrix)<-c(5,5)
# o<-makeCacheMatrix(testmatrix)
# o$setinverse()
# o$getinverse()
# 
# testmatrix<-rnorm(100*100)
# dim(testmatrix)<-c(100,100)
# 
# o$set(testmatrix)
# o$setinverse()
# o$getinverse()
# 
# testmatrix<-rnorm(10*10)
# dim(testmatrix)<-c(10,10)
# 
# o$set(testmatrix)
# o$getinverse()

