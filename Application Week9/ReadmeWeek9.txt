Readme file for Application Week 9, Spatial Techniques in Empirical Economics

I. Market Access II -- Using R and Stata to create the Least Cost Paths

*****************************************************************

I. Market Access II -- Using R and Stata to create the Least Cost Paths

1. We need three types of information in order to use R to calculate the least cost paths between cities: (i) the cost raster, (ii) the cities shape file (and it's associated files), a text file with the ids of the cities so we can put everything together in stata.
2. Export the text file with the city id's into the CostRasters folder.
3. Export the raster to a tiff format. Open the Raster to Other Format tool. Choose the Co1Raster, choose raster format Tiff, and save it in the CostRasters folder.
4. Make a new folder called Rwork and copy in the cost raster tiff file, the shape files for the cities, and the txt file with the city codes.
5. Close ARC.
6. Download the file "MA_Equidist.R" from the course webpage for week 9 and put it in the RWork folder.
7. Open the MA_Equidist.R file using a text editor.
8. Set your working directory in the "setwd" line.
9. Enter the name of your cost raster where the capitalized words are.
10. Enter the name of your cities point file where the capitalized words are.
11. If you haven't already, download R (and, if you wish, RStudio). See the syllabus for instructions on this (it's open source and pretty easy to find).
12. Open R.
13. Copy the code in the text file up to the line:

write.table(costmatrix,"cost1matrix",sep="\t")

and run the code.
14. Now run the rest of the code.
15. cost1matrix is the file with our least cost travel paths. Let's import it into stata to add id's and clean it up.
16. Close R. Open Excel.
17. Import the cities.txt file into excel using the text import wizard.
18. Delete all the columns except the city_id field. DON'T SORT IT OR ANYTHING LIKE THAT!
19. Save the excel file as city_ids.xlsx but don't close it.
20. Use excel to import the cost1matrix file.
21. Paste in the city_id column and then use the transpose operation to paste it in at the top row as well.
22. Insert another row above them. Then, in cell B1 type "d"&B1. Then copy the formula for the whole row.
23. Copy the row id's again and paste on top of each other as "values".
24. Delete the 2nd row.
25. Save the file as a .csv.
26. Close excel and open Stata.
27. Import the cost1matrix.csv file.
28. Type: rename v1 ocity
29. Type the command: reshape long d, i(ocity) j(dcity)
30. label var ocity "origin city"
31. label var dcity "destination city"
32. label var d "least cost travel path"
33. type "d" so you can see the description of the data.
34. Save the file as TravelCosts.
35. To calculate the market access measure assuming equal populations and sigma=1 use this bit of code:

drop if d==0
sort  ocity dcity 
gen MA =  (1)/((d)^1)
collapse (sum) MA, by(ocity)



























