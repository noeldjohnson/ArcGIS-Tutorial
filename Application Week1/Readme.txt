Readme file for Application Week 1, Spatial Techniques in Empirical Economics

I. Getting ArcGIS on your machine
II. Vector and raster data
III. Coordinate systems matter


*****************************************************************

I. Getting ArcGIS on your machine

Mason provides access to the ArcGIS suite on computers in the library. Joy Suh is the GIS contact for the library. You can learn more at this link:

http://dataservices.gmu.edu/2015/4506-arcgis-10-3-available

Additionally, since I'm teaching a class using GIS, Mason has a license that allows me to get you each a 1-year desktop student license. This will allow you to install ArcMap, ArcCatalog, etc... on ONE of your machines. ArcGIS runs only on PC's, so if you have a Mac (as I do) then you will either have to buy a program like Parallels which allows you to run a virtual PC environment, or, you can use boot camp (which I don't know much about). Here's a link to Parallels:

http://www.parallels.com/

Once you have the computer environment sorted, you can install ArcGIS using the license code I will provide you. Note that I'm currently using ArcMap version 10.1, you can download a more recent version is you wish, but a few of the commands we go through will be slightly different (you should be able to sort it out). Here are the instructions from ESRI (the ArcGIS monopolists) on how to install the software using your license code...

Version 10.1 and later - ArcGIS for Desktop Student Trial software Instructions

A. Before you install ArcGIS for Desktop

1. Check our system requirements to make sure your computer has the hardware and software required for the trial.

 

B. Activate your authorization code

2.      Visit www.esri.com/educationedition to begin the process of activating and downloading your ArcGIS for Desktop Student Trial software.

3.      Log in using your Existing Esri account, or sign-up for a new Esri account, if necessary.

4.      Enter the authorization code and click Activate ArcGIS.

a.      If you need to download ArcGIS for Desktop, proceed to step 5.

b.      If you received the ArcGIS for Desktop software from your instructor or license administrator, or will be installing from a network server, proceed to step 10.

5.      Click the button for the ArcGIS for Desktop software version being activated.

 

C. Download and install ArcGIS for Desktop Student Trial

6.      If necessary, download the ArcGIS Uninstall Utility and uninstall previous versions of ArcGIS Desktop or Server.  The software cannot be installed on a computer that has a previous version of ArcGIS for Desktop or ArcGIS for Server installed. It's OK if the computer has ArcGIS Explorer installed.

7.      If necessary, install the Microsoft .NET Framework (version 3.5 Service Pack 1 or higher).

If you are unsure if you have the .NetFramework installed, you can download a .net Version detector from the following site - http://www.asoft.be/prod_netver.html.
8.      Determine the location for the ArcGIS for Desktop software you wish to install and click the Download button.  You can also download the Tutorial Data, if desired.

9.      Double-click ArcGIS_Desktop_10XXXXXXX.exe (Depending on the version you selected, the file extensions may be different) to extract the installation files.

10.   Locate and run Setup.exe to install ArcGIS for Desktop.  The “Complete” installation is recommended.

11.   After the files are installed, the Authorization Wizard will open and prompt you to choose a product to authorize; select “ArcGIS Desktop Advanced (Single Use)” and click continue.

12.   The Authorization Wizard will prompt you for an authorization code; enter your activated code.  Follow the prompts and the software will authorize and be ready for use.  Note: leave the default option for the software extensions selected; they will be authorized automatically.

 
Support for the ArcGIS Desktop Student Trial is available at esri.com/trialhelp.



II. Vector and raster data

We will encounter two types of spatial data in this course: feature data and raster data.

To learn about these different data types, please read Melisa Dell's GIS notes section 1.2 now.

To learn about some techniques for importing data into Arc, please read Dell's GIS notes section 1.3 now.

I have put together some simple data sets for us to use in this course. Let's load some of them onto your machine now...

1. Open up ArcMap
2. Dismiss the "getting started" dialogue
3. Click on the plus sign (add data button) in the top menu
4. Navigate to the "Data Week1" folder that you downloaded from the class webpage. Note, Arc often doesn't like working with files off of a cloud, so you should transfer this folder to you local drive.
5. When you get to the folder, navigate to: Cities -> CitiesClass.shp and double click
6. You should see a bunch of points. These are feature data (vector data) because they are points. They are actually cities. 84 of them. In Europe. We'll see where after a few more steps...
7. At this point, pause and Read Dell's GIS notes section 1.4 on coordinate systems. THIS IS VERY IMPORTANT.
8. The data frame is the window you see your data in in Arc. It has it's coordinate system set separately from the data you actually import into the frame. The two should always line up (but as Dell explains, this is on you, Arc is too stupid to do it -- and failure to line them up will be catastrophic for your research).
9. Check the coordinate system of you data frame right now by clicking on View in the top menu and then the coordinate system tab. There is a bunch of useful information here. First, your current coordinate system should read "Europe Equidistant Conic". This is the projection of the frame. The geographic coordinate system should be "GCS_European_1950". This last one is most often going to be WGS1984 (in fact, when importing data, you should usually choose WGS1984 and then project the data later). The frame has these values because these are the coordinates set on the cities file you just imported. When there are no feature or raster data loaded into a frame, then it defaults to the coordinates of the first data set imported.

Second, you'll see in the coordinates dialog box that the "linear unit" is the meter. This is standard and what all your distance measurements are going to be measured in. Note that if your data wasn't projected, then there would be no linear unit and all your distance measurements would be in terms of angular units (degrees etc...).

We will come back to the data frame properties dialogue later.

10. Let's check on the coordinates of the feature data. Right click on the layer "citiesclass" and navigate to "properties" then click on the "source" tab.
11. The projected and geographic coordinate systems should be the same as you noted for the data frame.
12. Let's bring in  more data. Click on the add data button (plus sign). Navigate to the file in Data Week1 -> Seas -> SeasClass and open it.
13. You just brought in another vector data file. This time it's a polygon representing a Sea.
14. Check the coordinate system of the seas file to verify it's the same as for the cities data.
15. Let's save our work. Click on File -> Save as and save the file wherever you want (no clouds!). Note that Arc doesn't actually save all your files that you've been working on. Those files get directly altered as you manipulate them. Rather, what you just did was create a file which calls all the files together that you're currently working with (it's basically a list of file locations). If you want to take your work somewhere else, you need to copy the entire working folder you're using.
16. Let's figure out where the cities are we're looking at. Right click on the citiesclass layer and choose open attributes table. These are the meta-data associated with the points in the citiesclass layer. You'll see fields for longitude, latitude, city_id, city_jjk, and country. Under the city_jjk field are the names of the cities. You can see we're looking at Europe around the English channel with parts of England, France, and Belgium represented. There are 84 rows for each of the 84 cities we're looking at.

You can add meta-data from within Arc or import data to go with these cities from outside Arc (using excel, for example). We'll get more into this later. But for now, just note that YOU SHOULD ALWAYS HAVE A UNIQUE ID INTEGER FOR EACH ROW WHENEVER YOU WORK WITH DATA. This is how you relate data sets to each other and the advice (commmandment?) goes for any type of work with data (e.g. stata, R, whatever...). The identifier for the city data is "city_id".

17. Let's find London. Scroll down the list in the attribute table until you see London then left-click on the grey box to the furthest left of row. Close the attribute table. London should now be shaded in bright blue (aqua?). To undo this, switch from the "hand" cursor to "arrow" cursor (look for the buttons) and right click on London, choose "select/unselect".

18. Okay. Now let's load in some raster data. Click on the add data button (the plus sign) and navigate to the file potato -> res03_crav6190i_siir_wpo.tif and open it. It should line up with the other layers in the data frame. What you're looking at are data on "potato suitability" for the entire world at about 10km X 10km resolution (it depends on latitude). The colors of the raster correspond to a number between 1 and 8 with 1 being "most suitable" and 8 being "least suitable". A value of 9 means "water". These sorts of data are very cool and we'll being learning more about it next week.

19. Check the projection of the raster by right-clicking on the layer in the menu and looking at the properties. You'll notice that it is not projected. So let's do that.
20. Go to geoprocessing -> search for tools and type in "project raster".
21. Open the "project raster" data management tool. In the input raster pull-down menu choose "res03_crav6190i_siir_wpo.tif". The tool will create a new projected raster and save it where you tell it to. In the output raster dataset box enter the location and name for the new file. I suggest saving it in the potato folder and naming it something like potato_proj. Under "output coordinate system" search for "europe equidistant conic" or look in the menus under "projected coordinate systems" to find it. Choose europe equidistant conic. Choose bilinear interpolation (see the Dell notes for more on this). Choose the grid size to be 10000. Hit ok. You may need to now add the newly projected raster, or, sometimes Arc defaults to automatically adding the new layer.
22. uncheck the raster res03_crav6190i_siir_wpo.tif in the layers menu, or, better yet, right-click on it and remove it. Check the new raster to see that it is, indeed, now projected correctly.
23. Rasters can take on many more values than the 9 that we're interested in. If you click on the plus sign next to the raster name in the layer menu you'll see this. Let's clean up the symbology a bit. Right click on the layer and go to properties -> symbology. Choose "classified". It's cheating a bit, but keep "Jenks natural breaks" and choose 9 as the number of categories. Choose a greyscale or other color pattern you like and hit "ok".
24. Unlike the feature data, the potato raster is for the entire world. You can zoom out and in with your mouse in order to see this. Cool, right? This is a HUGE amount of data. Verify using the map that the scaling does, indeed, work like I said it does (e.g. higher numbers for places like the alps and lower numbers for places like Ukraine). This is one of the great benefits of GIS, you can visualize a huge amount of information and this allows you to (i) spot mistakes you might have made in entering the data or loading it in, (ii) see patterns you may have otherwise missed, (iii) convey to an audience a lot of information (a picture is worth a thousand words).
25. Let's verify we haven't mucked things up (this is common, so you should always be checking) by measuring the size of raster cell in France. Click on the measuring too (the ruler button). Drag the measuring tool across a cell using left-click. Double click when you're done. I just got a value of 10 kms which means we probably haven't messed up. Note: you might have to use the drop down menus to choose the units etc for the measuring tool.
26. Save your work.


III. Coordinate systems matter

1. Let's see why the projections are so important. Unclick all of the layers except the potato raster.
2. Zoom out so you can see the whole world. Weird, right? You can see that most of the world, except for Europe, looks pretty distorted. That's because I chose this projection because I wanted minimal distortion on the distance dimension for Europe. Think about spreading an orange peel on a flat surface. You can't do it. If you could stretch the peel, you could, but it would introduce distortions. You could however, for a local area, minimize the distortions introduced. I've chosen the projection that minimizes the distortions for Europe.
3. Let's mess things up. Go to View -> Data frame properties -> coordinate system. Navigate to projected coordinate systems -> World -> Mercator and choose it.
4. Now the world looks more "normal", right? But wait! Go back to a grid in France near the first one you measured and measure it again. How many kms? I get about 15! Crap. PROJECTIONS MATTER!
5. It gets worse, check the size of cell in Greenland. I get about 29kms. Distance measurements get more distorted in mercator as you move away from the equator.
6. Return to the View menu and change the projection back to Europe equidistant conic and let us never speak of this again.
7. Save your work.












