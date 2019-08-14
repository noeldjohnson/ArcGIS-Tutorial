Readme file for Application Week 2, Spatial Techniques in Empirical Economics

I. Clipping Your Data
II. Extracting Data to Points
III. Creating Buffers
IV. Extracting Data to Buffers

*****************************************************************

I. Clipping Your Data

1. Let's begin by opening up your work from last week that is contained in the "Data Week1" folder. I called my save file "Week1". Double click on that file (or whatever you named it).
2. Arc should open up all the layers you were working on last time.
3. If you click on the boxes in the layers menu next to all three layers we had imported (CitiesClass, SeasClass, and potato_proj) you'll see that the potato raster has a much bigger extent than the other layers. This is wasteful of both memory and processing power so let's clip out the portion of the raster we want to use.
4. Clipping a layer is basically like using a cookie cutter on dough. So the first thing we need is the cooking cutter (we already have the dough/layers). You can clip one layer using another layer as cookie cutter, but we wan't to use a more standardized shape, like a rectangle.
5. I already created a rectangle to clip the layers we opened last week. It's in the Data Week1 -> ClassBox folder. Open it up. Check to make sure it has the correct projection.
6. Left-click on the box immediately below ClassBox in the layers menu. You can now choose what color to make the rectangle. Choose "hollow".
7. Find the "clip raster" tool by searching for it in geoprocessing -> Search for tools.
8. Open the "Clip (Data Management)" tool.
9. Choose potato_proj as the input raster.
10. Choose ClassBox as the Output Extent. Click on "Environments" -> Raster Storage and choose "Pyramid Resampling Technique" -> "Bilinear"
11. Choose a location and name to save the new raster in the Output Raster Dataset pulldown menu. I'm calling my file potato_clip.
12. Hit OK.
13. My version of Arc automatically loaded in the new clipped raster. Notice it doesn't perfeectly line up with the edges of the rectangle. That's because Arc doesn't want to waste information, so if a pixel is on the edge of the rectangle, it keeps the whole pixel.
14. Check the projection and clean up the symbology of the new raster just like we did with the old one last week. You'll notice that the clipped raster data don't contain any pixels with the value of 1 or 9, so now the raster values go from 2 to 8. Interpretation is still the same.
15. You won't alway have someone provide you with a clipping rectangle/coookie cutter. So let's make one from scratch.
16. unclick the box layer but leave the potato raster visible.
17. Go to Customize -> toolbars and make sure "draw" is selected. You should now have the drawing tools visible as buttons towards the top of the window. 
18. Click on rectangle picture pulldown menu and choose rectangle. Draw your rectangle anyway you wish by left-clicking and dragging.
19. Left-click on the rectangle you drew. Go to the Drawing pull down menu. Select "convert graphics to feature". Choose where to save your new feature/rectangle. DON'T FORGET TO CHECK THE BOX TO "AUTOMATICALLY DELETE GRAPHICS AFTER CONVERSION".
20. Make your new rectangle hollow just like before. And you're done...


II. Extracting Data to Points

21. Let's extract some of the raster data to our cities. It's not ideal, but let's start by simply extracting to the city the value of the raster pixel the city is contained in.
22. Search for and open the "extract values to points" tool.
23. Your input is the CitiesClass layer.
24. The input raster is potato_clip.
25. Choose where to save the new output point features. I'm going to make a new folder called "ExtractedData" and save it there as "city_potato"
26. I also usually choose to check the "interpolate values" box just in case one of our cities doesn't quite overlap with a pixel.
27. Hit Ok.
28. A new point layer should have just appeared (otherwise you'll have to load it in). Right click on the cities_potato layer in the layers menu and choose attributes table.
29. The value of potato suitability for each city is RASTERVALU. Right-click the field name in the top row of the table. Choose Statistics. Check to make sure the descriptive stats make sense (count = 84, minimum = 2, maximum = 8, Nulls = 0 and the histogram looks reasonable).
30. Let's export the data to a format we can import to Excel or Stata. Left-click on the button in the top left corner of the screen right under the word Table. Choose Export. Choose a location to export your file. I'm putting it in ExtractedData and calling it cities_potato. I also usually export data as a text, or .txt, file. Sometimes you may wish to use .dbf instead. It depends. Hot Ok. Don't bother adding the data as a layer. Close the attribute table and check to make sure your data exported.
31. You can now import the .txt data as a comma deliminted file into Excel or Stata easily. 


III. Creating Buffers

32. What we just did won't always be ideal since we might not want to restrict ourselves to measuring suitability exactly where the city is. For example, perhaps we'd like to know average  suitability for a circle of radius 25km surrounding the city. 
33. To do this we need to first make a buffer, which is the name for the circle (or whatever shape) that we'll use to extract the data.
34. Go to Geoprocessing -> Buffer. Input = CitiesClass. I'm creating a Buffers folder and putting my new buffer in there called cities_25k.
35. Choose the linear unit to be kilometers and enter 25. Hit ok.
36. You can make the new buffers hollow if you wish (same technique as with the rectangles).

IV. Extracting Data to Buffers

37. You can extract raster data to polygons (the buffers are polygons), but it's a little annoying and I prefer to first convert the raster to point data and then join those to the buffers.
38. Find the Raster to Points tool. Enter the input raster and the output location. I made a file potato_points in the potato folder. The field should be "Value". Hit ok.
39. You can check on the descriptive stats for your new potato points by navigating to the attribute table and choosing statistics for the Grid_Code field.
40. To extract the average of the potato points in your buffers, right-click on the buffer in the layers menu (cities_25k) and choose joins and relates -> join.
41. You want to join data from another layer based on spatial location. Choose the potato_points layer. You want a summary stat for the points. I'm choosing Average (though you can choose any or all of the options if you wish). Choose a location to save the new data. I'm saving to ExtractedData and calling it potato_25k. Hit ok.
42. A new layer is created. Load it in if Arc doesn't automatically do so. Right-click on it and go to attributes table. The fields we're interested in are "Count_" and "Avg_GRID_C". Count gives you the number of points falling in each buffer. Check the stats on this to make sure there are no zeros. Avg_GRID_C is the average for each buffer. Check the stats. You can then export all these data at your leasure.
43. Save your work. I'm calling the new save file "Week2".



















