/*Assignment 1
Name - Ashwin David
Std Number - 500830814
Due Date - 2021/02/28 */

/* Q1. Read the file in SAS and 
display the contents using the import and print procedures */

proc import
datafile = "V:\CIND119\Assignment_1\breast_cancer_dataset.csv"
out = breast_cancer
dbms = csv replace;
getnames = yes;
run;
proc print data = breast_cancer;
title "Breast Cancer Dataset";
run;

/* clean the data and remove duplicates */
data breast_cancer_clean;
set breast_cancer;

proc sort data = breast_cancer_clean out = breast_cancer_clean;
by node_caps;

run;

proc print data = breast_cancer_clean;
title "Breast Cancer Dataset";
run;


/*ods rtf file = "V:\CIND119\Assignment_1\Breast_Cancer.pdf";
proc print data = breast_cancer_clean;
title "Breast Cancer Dataset";
run;
ods rtf close; */



/* Q1. b) Develop a decision tree-based 
classification model using the hpsplit procedure of SAS. */
ods graphics on;
proc hpsplit data = breast_cancer_clean;

class class age menopause tumor_size inv_nodes node_caps 
deg_malig breast breast_quad irradiat;

model class = age menopause tumor_size inv_nodes node_caps 
deg_malig breast breast_quad irradiat;
grow entropy;
prune costcomplexity;
run;

/* Q1. c) Navigate the contents of Results View by clicking on 
HPSplit breast-cancer-dataset, and then by selecting Model Assessment. 
Examine the confusion matrix, fit statistics, and variable importance.
*/
