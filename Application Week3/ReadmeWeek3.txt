Readme file for Application Week 3, Spatial Techniques in Empirical Economics

I. Measuring Linear Distances to Single Location
II. Measuing Linear Distances to Multiple Locations

*****************************************************************

I. Measuring Linear Distances

1. Let's begin by measuring the distance, in meters, from each city in the data set to London.
2. Unclick all of the layers except for the cities layer.
3. We need to make a new layer that consists of only London. Select london by pressing on the search button and then searching for london. If it says the address locator is damaged, just ask it to fix it repeatedly until you get the dialogue box.
4. Type london in and let it search. When it finds it, right click on the word london in the bottom output box and choose select. Close the search tool.
5. Right click on the citiesclass layer and choose selection -> create layer from selected features.
6. Click on the newly created layer and rename it something reasonable like "London".
7. Change the symology to an X or something similar.
8. Open the near tool. The input feature is citiesclass. The near feature is London. Uncheck location and click ok.
9. Right click on the cities class layer. The distances to london in meters are under the Near_dist field.
10. Check the summary stats. You'll see that one distance is -1 (or at least it is on my machine). That's london's distance to london. I don't know if this is a mistake, measurement error, or a default, but you'll need to edit it and change it to a zero after you export the data (you could do this in Arc, but it's a pain).


II. Measuring Linear Distances to Multiple Locations

11. Now let's measure the distance between each city dyad.
12. Open the near table tool.
13. Set input features as CitiesClass. Set the near features as CitiesClass. Choose a location to save the table. I choose to name it DCities_Dyads and save it on my desktop since Arc is too stupid to allow file names with spaces using this particular tool.
14. Make sure "Find only closest features" is unchecked. Hit ok.
15. Import your table into Arc and open it.
16. Check the number of entries. It should be (84x84)-84 = 6,972. Arc drops the diagonal entries (distance to own cities).
17. Check the descriptive statistics.
18. You'll notice that, annoyingly, Arc has dropped the city id's. So we need to make a file which we can use to map the in_fid and out_fid fields into our city_id's.
19. Open the attribute table for CitiesClass.
20. Use the drop-down menu to Add Field. Choose short integer. Name the field FID_Code.
21. right-click on the field name at the top of the column and choose field calculator.
22. In the equation box enter FID and hit ok.
23. Now export these data.
24. Open stata (or whatever statistical package you use, e.g. spss, sas, etc... -- it shouldn't be excel).
25. choose file -> import -> choose the text file.
26. drop near_fid, near_dist, and fid_.
27. export the near table you created.
28. import it into stata. save it as a stata file.
29. rename in_fid fid_code
30. data -> combine datasets -> merge two datasets. many to one on key variables. key variable is fid_code. choose cities_codes as the file to merge with.
31. drop _merge rowid_ objectid fid_code
32. rename city_id origin_city
33. rename near_fid fid_code
34. data -> combine datasets -> merge two datasets. many to one on key variables. key variable is fid_code. choose cities_codes as the file to merge with.
drop _merge fid_code 
32. rename city_id dest_city










