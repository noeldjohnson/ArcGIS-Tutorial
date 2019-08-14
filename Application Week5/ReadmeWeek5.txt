Readme file for Application Week 5, Spatial Techniques in Empirical Economics

I. Drawing Grids
II. Extracting Temperature Data


*****************************************************************

I. Drawing Grids

1. Start with just the CitiesClass and the SeasClass layers active.
2. Sometimes the unit of analysis one wants to use is more naturally assigned to arbitrary grids. So let's make some grids.
3. Create a new folder called "Grids".
4. Open the Grid Index Features tool. Save the feature as Grid5k in your grids folder. You can define the borders of the grid using the clipping box we created a few classes ago. Just choose your box as the "Input Features". Uncheck the "Generate Polygon Grid" option. Choose a Polygon Width and Height as 5 kilometers. Hit Ok.
5. Load in the grid if you have too. Change the symbology so that it is hollow. Check that the grids are, indeed, 5 kilometers square using the measuring tool.
6. Sometimes you only want the grids to cover the relevant area of your analysis. For example, maybe we don't want the seas to be covered.
7. Let's bring in a shape file which delineates land borders. Bring in the "Europe Modern Countries" folder from the course webpage. Load in the shape file it contains. Check the projection is correct. Clip it to the correct shape using our class clipping box.
8. Now reopen the Grid Index Features tool. Seave the file as Grid5k_noseas. Make the input feature the countries shape file. Click the Generate Polygon Grid box. Make sure the grids are 5x5km. Click ok. Load in the grid.

II. Extracting Temperature Data

9. Now lets extract some temperature data.
10. Download and save the TempGrid folder from the course webpage.
11. Load in the grid shapefile. Verify that's it has the correct projection. Do not clip it. Open up the attribute table. You'll see that this contains yearly growing season temperature deviations at the grid points for the years 1300-1500.
12. Let's automate the creation of temperature rasters for the years 1300-1350.
13. Create a folder in the temperature folder called Rasters.
14. Search for the IDW tool, right-click on it, and choose Batch.
15. Hit the plus sign until there are 50 rows.
16. Right-click on the input point features and browse to the temperature grid.
17. The Z field is 1300
18. Save the ooutput raster as 1300 in your newly created rasters folder.
19. Power 2 and Variable 12 are fine.
20. Open Excel.
21. Paste in the values for the first row in the columns. In Excel drag and fill in the values for years up to 1349.
22. Now paste in these values to IDW window. Hit Ok.
23. You could use a similar procedure to extract the value of the rasters for the cities, but I'll leave this for you to do on your own.