# sldataMunging
----------------

author : steeve laquitaine
purpose : sets of codes to re-shape and transform datasets for use with various functions.

List of functions 

[slconvMat2Csv.m](slconvMatToCsv.m) : convert matlab variable into a csv file saved in local directory.  

[slsetNumInstancesByVar.m](slsetNumInstancesByVar.m) : balance the number of instances of different levels of a variable in a Nr rows by Nc columns dataset matrix (e.g., a data set made voxel responses to 20 instances of 90 deg motion and 30 instances of 180 deg motion becomes is reduced to 20 instances for each motion direction). This is useful for classification (e.g., with support vector machine) which accuracy is biased by unbalanced ocurrence of different classes.

[slmatToCellByVar.m](slmatToCellByVar.m) : sort dataset by variable levels. Data for each variable level are contained in a separate cell.

SLcircShiftXandY4Plot.m  

SLfindEmptyCells.m  

SLfindRow.m  

SLimakeColumn.m  

SLisCellEmpty.m  

SLmakeColumn.m  

SLmakeRow.m  

sladdZerobeforeNum2str.m  

slbalanceDataForVar.m  

slconvMatAllCellsToCsv.m   

slmatrixReplaceVals.m  

slsetNumInstancesByVar.m  
