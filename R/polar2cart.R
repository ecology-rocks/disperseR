#' Convert Polar Coordinates To Cartesian Coordinates
#'
#' This function converts polar coordinates to cartesian coordinates. It needs
#' an origin (x,y), as well as an individual number or vector of numbers for
#' distance and bearing.
#'
#' @param x The origin x-coordinate. Numeric.
#' @param y The origin y-coordinate. Numeric.
#' @param dist A number or vector of numbers of distances from the origin.
#' @param bearing A number or vector of numbers representing the degrees away
#'   from the origin. This follows traditional polar coordinates, with 0 at
#'   "east", 90 at "north", etc.
#' @param as.deg Default set to true, if false, then the program assumes that
#'   "bearing" is entered in radians instead of degrees.
#' @param rnd The rounding value. Default is NA, for no rounding. Set to 0 for integers, 1 for 1 decimal point, etc.
#'
#' @return This function returns a list with "x" and "y" coordinates for the polar coordinates entered.
#' @examples
#' polar2cart(1, 1, 2, 90)
#' polar2cart(1,1,c(2,2,2),c(90,180,270) )
#'
#' @export
#'

polar2cart<-function(x,y,dist,bearing,as.deg=TRUE, rnd=NA){
  ## Translate Polar coordinates into Cartesian coordinates
  ## based on starting location, distance, and bearing
  ## as.deg indicates if the bearing is in degrees (T) or radians (F)

  if(as.deg){
    ##if bearing is in degrees, convert to radians
    bearing=bearing*pi/180
  }

  newx<-x+dist*sin(bearing)  ##X
  newy<-y+dist*cos(bearing)  ##Y

  if(!is.na(rnd)){
    newx <- round(newx, rnd)
    newy <- round(newy, rnd)
  }

##if we get a table in where the origin is equal to one of the points, it's
##going to show badly, as NaN, in the transformation. Since we know that this is
##the only time the NaN shows, we can simply set those to our origin points
##after transformation.

for(i in 1:length(newx)){
  if(is.nan(newx[i])){
    newx[i] <- x
    newy[i] <- y
  }
}


  if(min(newx) < x){
    newx <- newx + (x-min(newx))
  }
  if(min(newy) < y){
    newy <- newy + (y-min(newy))
  }
  return(data.frame("x"=newx,"y"=newy, stringsAsFactors=F))
}
