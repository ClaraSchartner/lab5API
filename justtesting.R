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
sol
}
input("Graz", "Vienna")
