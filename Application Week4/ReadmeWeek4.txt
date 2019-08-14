Readme file for Application Week 4, Spatial Techniques in Empirical Economics

I. Importing Data
II. Drawing a polygon/polyline
III. Spatially Interpolating Values

*****************************************************************

I. Importing Data

1. Let's import some metadata for the cities. Begin by unclicking all of the layers except the CitiesClass layer.
2. Create a new folder called "Population" and put the file city_pop_84.csv in it (this file is in the same folder as these notes were).
3. Add the .csv file using the plus sign button.
4. These are not spatial data. They have no projection, coordinates, or anything like that. But they do have the city_id variable, so we can associate the data with our CitiesClass data, which are spatial.
5. Right click on the CitiesClass layer and choose Joins and Relates -> Joins.
6. Choose to "Join Attributes from a Table". The field is city_id. The table is city_pop_84.csv. Keep all records. Validate the join. Then hit Ok.
7. Open the CitiesClass attribute table. There is a new variable now "pop" which is the population of the cities in thousands in 1700 from Bairoch, Chandler, and other sources (corrected in Jedwab, Johnson, and Koyama (2016)). You'll notice there are a bunch of null values. These should show up in any calculations as missing values. Check the statistics of the field just to be sure they're not zeroes or something else silly.
8. Save your work.

II. Drawing a polygon/polyline

9. Now let's draw a polyline that we can use as a border for an RD analysis. This will obviously be an arbitrary line, but we'll learn more about putting in actual map data later.
10. Add in the Seas layer so we have perspective on where we are.
11. In the drawing menu click on the drop-down menu next to the square and choose line.
12. Draw your line somewhere. Every time you left click a new vertex is created. When you double click, you're done.
13. Make a new folder called "Border".
14. Left-click on the line you drew. Go to the Drawing pull down menu. Select "convert graphics to feature". Save your new feature/line in the Border folder you just created. DON'T FORGET TO CHECK THE BOX TO "AUTOMATICALLY DELETE GRAPHICS AFTER CONVERSION".
15. Check to make sure your new feature has the correct projection.
16. You can now use the near tool to figure out the distances of all the cities from the border you have created. You can export these distance data along with the population data to stata, and then go to town with your RD (which hopefully doesn't "work").

III. Spatially Interpolating Values

17. Let's make a picture to go along with our RD.
18. We want to represent the population of the cities over space on either side of the border. So let's create a raster whose pixels take on some interpolated average population based on the cities around it.
19. There are many ways to do this. We are going to use inverse distance weighting. Here's a webpage explaining what's going on:

http://webhelp.esri.com/arcgisdesktop/9.2/index.cfm?TopicName=How_Inverse_Distance_Weighted_(IDW)_interpolation_works

Here's another one:

http://www.gitta.info/ContiSpatVar/en/html/Interpolatio_learningObject2.xhtml

20. Open up the IDW spatial analyst tool.
21. Input points are CitiesClass. Z value is pop. Save the new raster in the population folder. I called it pop_raster_p2. Choose a power of 2 (we'll return to this). Allow for a variable search radius using closest 12 points. Choose the Border as a barrier polyline. Click ok.
22. Import the the raster. You can see that London is really driving things. Feel free to play around with the symbology. 
23. Now let's use cross-validation to choose the optimal power.
24. From the Customize menu put in the Geostatistical Analyst toolbar.
25. Click no the geostatistical wizard (the little picture on the toolbar).
26. The source data set is CitieClass. The Data field is city_pop_84.csv.
27. Click on the button next to the Power field to "optimize power". This will use cross-validation to choose the power so as to minimize mean squared error. It chooses 34.7, which is ridiculously high. Basically it means there's no spatial correlation in pop over this sample of cities. 
28. The next page gives you whole bunch of stats on how well the interpolation worked. In our case, it didn't.
29. You can see from the map, there's no relationship there.








