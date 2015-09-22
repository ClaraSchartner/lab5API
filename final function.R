



input<-function(origin,destination){
  text<-"https://maps.googleapis.com/maps/api/directions/json?origin="
  key<-"&key=AIzaSyDPWJQAU2Ck9WA8DSg_aWPmrk0F5buL-zk"
  inquery<-"&destination="
  url.query<-paste0(text,origin,inquery,destination,key)
  r<- GET(url.query)
  
  
  
  
  longi.lati<-function(r){
    
    l<-length(content(r)$routes[[1]]$legs[[1]]$steps)
    
    
    lati<-function(r){
      location.lat<-NULL
      for(i in 1:l){
        location.lat[i]<-content(r)$routes[[1]]$legs[[1]]$steps[[i]]$start_location$lat[[1]]
        
        
      }
      location.lat
    }
    
    lng<-function(r){
      
      location.lng<-NULL
      for (i in 1:l){
        location.lng[i]<-content(r)$routes[[1]]$legs[[1]]$steps[[i]]$start_location$lng[[1]]
      }
      location.lng
    }
    
    location<-function(r){
      long<-lng(r)
      lat<-lati(r)
      data.frame(lat,long)
    }
    
    locations<-location(r)}
  sol<-longi.lati(r)


library(ggplot2)
library(ggmap)
library(mapproj)
library(maps)
difference<-max(abs(max(sol$lat)-min(sol$lat)),abs(max(sol$long)-min(sol$long)))
  if(difference<60){
    if(difference<40){
      if(difference<30){
        if(difference<10){
          if(difference<4){
            if(difference<2){zoom<-8}
          }else{zoom<-6}
        } else{zoom<-5}
      }else{zoom<-4}
    } else{zoom<-3}
  }else{zoom<-1}


al1	=	get_map(location	=	c(lon	=	(max(sol$long)+min(sol$long))/2,	lat	=	(max(sol$lat)+min(sol$lat))/2),	zoom	=	zoom,	maptype	=	'terrain')
al1MAP	<-	ggmap(al1)+	geom_point(data=sol, aes(x=long, y=lat), color="red")
al1MAP

}

input("Vienna","Graz")
