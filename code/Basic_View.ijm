 //Read images from folder and create a max projection out of the stereology
 
 inputdir = "/Users/dani/Dropbox/MANAGEMENT/UCSF/2020/dipcell/data/";
 outputdir = "/Users/dani/Dropbox/MANAGEMENT/UCSF/2020/dipcell/data_output/";
 FileList = getFileList(inputdir);
 
 nfiles = (lengthOf(FileList));

 for (i=0;i<nfiles;i++){
 	//print(FileList[i]);
 	file = inputdir + FileList[i];
	run("Bio-Formats", "open=["+file+"] autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT"); 	
	run("Stack to RGB", "frames keep");
	run("Z Project...", "projection=[Max Intensity]"); //MIP
	run("Enhance Contrast", "saturated=0.35");
	saveAs("Tiff", outputdir+FileList[i]);
	run("Close All");

 }

kkkk
outputdir = "/Users/dani/Dropbox/MANAGEMENT/UCSF/2020/dipcell/data_output/";
run("Image Sequence...", "open="+outputdir+" file=Section1_ sort");
run("Make Montage...", "columns=2 rows=3 scale=0.25 label");
run("Enhance Contrast", "saturated=0.35");
saveAs("PNG", outpudir+"Montage.png");


//run("8-bit");
//setAutoThreshold("MinError dark");
