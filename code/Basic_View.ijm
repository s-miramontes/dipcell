 //Read images from folder and create a max projection out of the stereology
 
 inputdir = "/Users/dani/Dropbox/MANAGEMENT/UCSF/2020/data/";
 outputdir = "/Users/dani/Dropbox/MANAGEMENT/UCSF/2020/data_output/";
 FileList = getFileList(inputdir);
 
 nfiles = (lengthOf(FileList));

 for (i=0;i<nfiles;i++){
 	//print(FileList[i]);
 	file = inputdir + FileList[i];
	run("Bio-Formats", "open=["+file+"] autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT"); 	
	run("Stack to RGB", "frames keep");
	run("Z Project...", "projection=[Max Intensity]"); //MIP
	saveAs("Tiff", outputdir+FileList[i]);
	run("Close All");

 }

break
run("Image Sequence...", "open=/Users/dani/Dropbox/MANAGEMENT/UCSF/2020/data_output file=Section1 sort");
run("Make Montage...", "columns=2 rows=3 scale=0.25 label");
run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
saveAs("PNG", "/Users/dani/Dropbox/MANAGEMENT/UCSF/2020/data_output/Montage.png");


//run("8-bit");
//setAutoThreshold("MinError dark");
