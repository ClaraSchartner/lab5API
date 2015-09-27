#'Finding the directions
#'
#'A function to find the route between two countries/cities.
#'
#'@param origin a character string for the name of the origin
#'@param destination a character string for the name of the destination
#'@param avoid an optional parameter using to indicate that the calculated route should avoid this typical features.
#'Followings are the list of features:
#'\itemize{
#'  \item tolls
#'  \item highways
#'  \item ferries
#'}
#'@param travel_mode an optional parameter using to indicate the mode of travel.
#'\itemize{
#'  \item \strong{driving} (default): indicates the driving direction on the road.
#'  \item \strong{walking}: indicates walking direction on the pedestrian.
#'  \item \strong{bicycling}: indicates the bicycling direction on the bicycle path.
#'}
#'
#'@return The map showing the origin and destination places along with 
#'the several red dots which indicate the intersection or crossing between the route.
#'
#'@examples
#'directions("Vienna", "Graz")
#'directions("Bangkok", "Pattaya", avoid="tolls")
#'directions("Manchester", "Leeds", travel_mode="walking")
#'

directions<-function(origin,destination,avoid=NULL,travel_mode="driving"){
    library(httr)
    library(ggplot2)
    library(ggmap)
    library(mapproj)
    library(maps)
    library(XML)
  stopifnot(!(exists("origin")&exists("destination")))
    stopifnot(is.character(origin) & is.character(destination))
    url.query<-NULL
    text<-"https://maps.googleapis.com/maps/api/directions/json?origin="
    inquery<-"&destination="
    if(is.null(avoid)){
        av<-NULL
    }else{
        av<-"&avoid="
    }
    mode<-"&mode="
    key<-"&key=AIzaSyDPWJQAU2Ck9WA8DSg_aWPmrk0F5buL-zk"
    url.query<-paste0(text,origin,inquery,destination,av,avoid,mode,travel_mode,key)
    r<-GET(url.query)
    stopifnot(!is.null(url.query))
  stopifnot(length(content(r)$routes)>0)
  
    longi.lati<-function(r){
    
        l<-length(content(r)$routes[[1]]$legs[[1]]$steps)
    
        lati<-function(r){
            location.lat<-NULL
            for(i in 1:l){
                location.lat[i]<-content(r)$routes[[1]]$legs[[1]]$steps[[i]]$start_location$lat[[1]]
            }
            return(location.lat)
        }
    
        lng<-function(r){
            location.lng<-NULL
            for (i in 1:l){
                location.lng[i]<-content(r)$routes[[1]]$legs[[1]]$steps[[i]]$start_location$lng[[1]]
            }
            return(location.lng)
        }
    
        location<-function(r){
            long<-lng(r)
            lat<-lati(r)
        return(data.frame(lat,long))
        }

    locations<-location(r)
    }
    sol<-longi.lati(r)
  

    difference<-max(abs(max(sol$lat)-min(sol$lat)),abs(max(sol$long)-min(sol$long)))
  
    breaks<-c(60,50,40,30,10,5,3,2,1,0.7,0.3)
    zoom.options<-c(1:11)
    zoom<-zoom.options[sum(difference<breaks)]
  
    al1<-get_map(location = c(lon = (max(sol$long)+min(sol$long))/2, lat = (max(sol$lat)+min(sol$lat))/2),zoom = zoom, maptype = 'roadmap')
    al1MAP<-ggmap(al1)+geom_point(data=sol, aes(x=long, y=lat), color="red")+xlab("Longitude")+ylab("Latitude")+ggtitle("Direction Map")
    return(al1MAP)
}
