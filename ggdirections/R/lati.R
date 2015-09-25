lati <-
function(r){
            location.lat<-NULL
            l<-NULL
            for (j in 1:le.leg){
              l[j]<-length(content(r)$routes[[1]]$legs[[j]]$steps)
            for(i in 1:l){
                location.lat[l[1]*(j-1)+i]<-content(r)$routes[[1]]$legs[[j]]$steps[[i]]$start_location$lat[[1]]
            }}
            return(location.lat)
        }
