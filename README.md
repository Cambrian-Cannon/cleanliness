# Human Activity Recognition Using Smartphones - Tidy Data Generation
Getting and Cleaning Data Coursera Project
By Abhir Deshpande

## Repository Structure:
* [run_analysis.R](run_analysis.R): The complete R script used to download, merge, filter, and clean the dataset.
* [CodeBook.md](CodeBook.md): A markdown codebook describing the variables, data structures, and transformations applied to clean up the data.
* [README.md](README.md): This file, explaining the analysis script and execution steps.
* [final_tidy_dataset.txt](final_tidy_dataset.txt): The final exported tidy dataset containing the calculated averages.
* [UCI HAR Dataset](UCI HAR Dataset/): The raw dataset used by the R script.

## Workflow (`run_analysis.R`)
The script is fairly straightforward with 5 distinct steps

1. **Merging Training and Testing Datasets** Loads [training](UCI HAR Dataset/train/X_train.txt) and [testing data](X_test.txt) and merges the two
2. **Extracting Mean and Standard Deviation Values** Selects columns with mean or std in their name using `grep()`
3. **Assigning Activity Names** Read from `y_train.txt`
4. **Using more descriptive names** Replaces abbrieviations with full names and other miscellaneous items. Check `CodeBook.md` for more information
