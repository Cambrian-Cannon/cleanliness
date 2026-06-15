# Code Book: Human Activity Recognition Cleaned Summary

This codebook describes the variables, data transformations, and summaries calculated to create the final `final_tidy_dataset.txt` output file.

## Dataset Profile
* **Rows:** 180 (Representing 30 distinct human subjects performing 6 different daily activities).
* **Columns:** 68 (2 identifier variables + 66 numeric signal measurements).

## Identifiers and Grouping Variables

### Subject
* **Type:** Integer
* **Values:** 1 to 30
* **Description:** Unique numerical ID assigned to each of the 30 human volunteers who participated in the data gathering experiments.

### Activity
* **Type:** Factor (Character display)
* **Values:** WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* **Description:** The specific kinetic activity being performed by the volunteer during sensor measurements.

--------------------------------------------------------------------------------------------------------------------------------------------------

## Signal Variables and Measurements
All signal values listed below represent the **mathematical mean** of the original feature windows, grouped per subject and activity. 

* **Normalization:** All numerical values are normalized and bounded strictly between **[-1, 1]**, making them unitless.
* **Naming System:** 
  * `Time_` prefix denotes time-domain features calculated from raw sensor data.
  * `Frequency_` prefix denotes frequency-domain features created by applying a Fast Fourier Transform (FFT).
  * `Accelerometer` or `Gyroscope` details the input instrument.
  * `mean` or `std` identifies whether the underlying metric was an average or standard deviation.
  * `_X`, `_Y`, `_Z` notes the respective tri-axial vector path.

### Full Variable Index (Columns 3 to 68)
1. `Time_BodyAccelerometer_mean_X`
2. `Time_BodyAccelerometer_mean_Y`
3. `Time_BodyAccelerometer_mean_Z`
4. `Time_BodyAccelerometer_std_X`
5. `Time_BodyAccelerometer_std_Y`
6. `Time_BodyAccelerometer_std_Z`
7. `Time_GravityAccelerometer_mean_X`
8. `Time_GravityAccelerometer_mean_Y`
9. `Time_GravityAccelerometer_mean_Z`
10. `Time_GravityAccelerometer_std_X`
etc.
