Readme file for Application Week 8, Spatial Techniques in Empirical Economics

I. Market Access I -- Creating the files to export to R

*****************************************************************

I. Market Access I -- Creating the files to export to R

1. Start with the CitiesClass feature data loaded in.
2. Now let's add layers containing medieval trade routes and rivers.
3. Download the Rivers_clipped and MedRds_clipped layers from the class webpage week 8 folder and add them in to Arc. Check to see that they're projected correctly.
4. Despite their names, the layers aren't clipped for our data, so use the clipping box you made to clip these layers.
5. If you open up a seas, roads, or rivers layer you'll see that there are fields called seco1, seco2, sesp2, and sesp1. These correspond to 1-[the cost of travel by this technology]. They come from historical estimates (for the cites, see the my paper with Mark and Remi that we discussed in class today). 
6. Now load in your 5x5km grid.
7. We're going to extract the least cost travel option for each grid cell. To do this, first we need to join the costs associated with the travel layers to the grid sequentially.
8. Do this for seas, then using the newly created layer, do it for rivers, and then do it for roads. When performing the join, choose maximum as the summary attribute (remember, the cost parameters are 1-[the cost of travel by this technology]). Save the new grids in the grids folder.
9. Now we want to create a new field that contains the value of the least cost travel option for each grid (assuming that no road, sea, or river, means maximum cost (1) using portage. Open the data table for the last grid you joined. Use the drop-down menu in the upper left corner to create a new field. Choose float and name it something like MinCo1. Right click on the field name and choose calculate field. Click python code and write the following bit of code in the dialogue box: 1-max([!Max_seco1!,!Max_rvco1!,!Max_mrco1!]). Hit ok.
10. Verify, the the field did populate with the minimum travel costs.
11. Now lets turn the feature grid into a raster. Create a folder called CostRasters. Open the Feature to Raster tool. Input feature is GridJoin_Final. The field is MinCo1. Save it as Co1Raster in the CostRasters folder. Choose a cell size of 5000 (because the grids are 5x5km). Hit ok.
12. Verify that the new raster makes sense by right clicking on a few of the cells to see if they have the correct values for travel cost.
13. That's it for today. Next week, we'll use the cost raster we've created and the shape file with the city points in combination with some code in R to calculate the least cost travel paths.







