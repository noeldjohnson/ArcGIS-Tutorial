library(maptools)
library(sp)
library(rgdal)
library(xlsx)
library(gdistance)
library(raster)
library(gdata)
require(gdata)
library(dismo)

setwd("INSERT WORKING DIRECTORY HERE")

samplecost <- raster("ENTER COST RASTER WITH EXTENSION HERE")

writeRaster(samplecost,"samplecost.grd")

plot(samplecost)

samplecities <- readOGR(".","ENTER CITIES SHAPE FILE WITHOUT EXTENSION HERE")

proj4string(samplecities)

projection(samplecost)

samplecitiescoords <-as.data.frame(coordinates(samplecities))

plot(samplecities,pch=16,col="red")
plot(samplecost,add=TRUE,alpha=.5)

transition_raster <- transition(1/samplecost,mean,8)

x <- as.numeric(samplecitiescoords [,1])

y <- as.numeric(samplecitiescoords [,2])

coord <-matrix(c(x,y),ncol=2)

costmatrix <-costDistance(transition_raster,coord,coord)

write.table(costmatrix,"cost1matrix",sep="\t")

Cambridge <-c(-664178.4,2511501)

Amiens <-c(-545724.0,2238112)

CambridgeToAmiens <-shortestPath(transition_raster,Cambridge,Amiens,output="SpatialLines")

lines(CambridgeToAmiens,col="black")


