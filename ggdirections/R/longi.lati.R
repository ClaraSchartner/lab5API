longi.lati <-
function(r){
    
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
