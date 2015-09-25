library(httr)
library(ggplot2)
library(ggmap)
library(mapproj)
library(maps)

directions<-function(origin,destination,avoid=NULL,travel_mode=NULL){
    text<-"https://maps.googleapis.com/maps/api/directions/json?origin="
    key<-"&key=AIzaSyDPWJQAU2Ck9WA8DSg_aWPmrk0F5buL-zk"
    inquery<-"&destination="
    if(is.null(travel_mode)){
        mode<-NULL
    }else{
        mode<-"&mode="
    }
    if(is.null(avoid)){
        av<-NULL
    }else{
        av<-"&avoid="
        }
    url.query<-paste0(text,origin,inquery,destination,av,avoid,mode,travel_mode,key)
    r<-GET(url.query)
  
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
