library(httr)

#Our API key
# AIzaSyDPWJQAU2Ck9WA8DSg_aWPmrk0F5buL-zk 


r<-GET("https://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal&key=AIzaSyDPWJQAU2Ck9WA8DSg_aWPmrk0F5buL-zk")
status_code(r)

headers(r)
content(r, "raw")
f<-GET("https://maps.googleapis.com/maps/api/directions/json?origin=Chicago,IL&destination=Los+Angeles,CA&waypoints=Joplin,MO|Oklahoma+City,OK&key=AIzaSyDPWJQAU2Ck9WA8DSg_aWPmrk0F5buL-zk")
status_code(f)
f


content(f)$routes[[1]]$legs[[1]]$steps[[1]]$start_location$lat[[1]]

longi.lati<-function(r){
l<-1
determine<-1
while(determine){
determine<-c(FALSE)
determine<-is.numeric(content(r)$routes[[1]]$legs[[1]]$steps[[l]]$start_location$lat[[1]])
l<-l+1
}
l<-l-1

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
location(r)
