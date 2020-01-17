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

//Train manually, then call this
call("trainableSegmentation.Weka_Segmentation.getProbability");


selectWindow("Classification result");
run("Make Substack...", "slices=1");
rename("CandidateNeurons");
setThreshold(0.9, 1); //only consider candidates those with p>0.9
run("Convert to Mask", "  black"); 
run("Set Measurements...", "area redirect=None decimal=3");
run("Dilate");
run("Analyze Particles...", "size=5000-Infinity show=Masks display clear include in_situ");
run("Fill Holes");
run("Remove Outliers...", "radius=5 threshold=50 which=Bright");
run("Analyze Particles...", "size=5000-Infinity show=[Bare Outlines] display clear include in_situ");
run("Dilate");

//Open old image manually
selectWindow(win);
run("Add Image...", "image=CandidateNeurons x=0 y=0 opacity=100 zero");