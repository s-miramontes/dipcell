/*
Run Weka with 3 classes and create qualitative evaluation
*/


datapath = "/Users/dani/Dropbox/MANAGEMENT/UCSF/2020/dipcell/data_output/";
img = newArray(
"Section1_Contour Name 1_P2757#50_2_0001.tif",
"Section1_Contour Name 1_P2757#50_2_0005.tif",
"Section1_Contour Name 1_P2757#500056.tif",
"Section1_Contour Name 1_P2757#500057.tif",
"Section1_Contour Name 1_P2757#500058.tif",
"Section1_Contour Name 1_P2757#500059.tif")

//1. open MIP tif
i = 5;

open(img[i]);
run("Trainable Weka Segmentation");


