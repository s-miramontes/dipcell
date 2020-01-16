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

call("trainableSegmentation.Weka_Segmentation.getProbability");
selectWindow("Probability maps");

run("Make Substack...", "slices=1");
rename("CandidateNeurons");
setThreshold(0.9, 1);
run("Convert to Mask", "  black"); 


run("Set Measurements...", "area redirect=None decimal=3");
run("Analyze Particles...", "size=6000-Infinity show=[Bare Outlines] display clear include in_situ");


selectWindow(win);
run("Add Image...", "image=CandidateNeurons x=0 y=0 opacity=100 zero");