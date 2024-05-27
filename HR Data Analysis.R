#Title: HR Data Analysis

#1 load the data
HR_data=read.csv("HR Data.csv")
library(dplyr)

#2 View the structure of the data
# View the first few rows
head(HR_data)
# Check the structure
str(HR_data)

#3 Remove unnecessary columns
# Remove unnecessary columns
HR_data <- HR_data %>%
  select(-EmployeeCount, -StandardHours)

#4  Rename columns
# Rename columns
colnames(HR_data)
colnames(HR_data) <- c("Age", "Attrition", "BusinessTravel", "DailyRate", "Department", 
                       "DistanceFromHome", "Education", "EducationField", "EmployeeNumber", 
                       "EnvironmentSatisfaction", "Gender", "HourlyRate", "JobInvolvement", 
                       "JobLevel", "JobRole", "JobSatisfaction", "MaritalStatus", "MonthlyIncome", 
                       "MonthlyRate", "NumCompaniesWorked", "Over18", "OverTime", "PercentSalaryHike", 
                       "PerformanceRating", "RelationshipSatisfaction", "StockOptionLevel", 
                       "TotalWorkingYears", "TrainingTimesLastYear", "WorkLifeBalance", 
                       "YearsAtCompany", "YearsInCurrentRole", "YearsSinceLastPromotion", 
                       "YearsWithCurrManager")
colnames(HR_data)

#5 Eliminate redundant(needless) entries
# Remove duplicate rows
HR_data <- HR_data %>%
  distinct()
HR_data

#6 Sanitize specific columns
# Convert categorical columns to factors
HR_data$Attrition <- as.factor(HR_data$Attrition)
HR_data$BusinessTravel <- as.factor(HR_data$BusinessTravel)
HR_data$Department <- as.factor(HR_data$Department)
HR_data$EducationField <- as.factor(HR_data$EducationField)
HR_data$Gender <- as.factor(HR_data$Gender)
HR_data$JobRole <- as.factor(HR_data$JobRole)
HR_data$MaritalStatus <- as.factor(HR_data$MaritalStatus)
HR_data$Over18 <- as.factor(HR_data$Over18)
HR_data$OverTime <- as.factor(HR_data$OverTime)

#7  Eliminate NaN values
# Remove rows with NaN values
HR_data <- HR_data %>%
  na.omit()
HR_data

#8 Additional cleaning steps
# Check for outliers in numerical columns
summary(HR_data$DailyRate)
summary(HR_data$MonthlyIncome)
# Additional steps to handle outliers can be added here
# Normalize numerical columns (example)
HR_data$DailyRate <- scale(HR_data$DailyRate)
HR_data$DailyRate
HR_data$MonthlyIncome <- scale(HR_data$MonthlyIncome)
HR_data$MonthlyIncome
#check the missing value
any(is.na(HR_data))
#Comment: FALSE indicate there is no missing value in the dataset.

#9 Save the cleaned data
write.csv(HR_data, "C:/Users/user/Documents.csv", row.names = FALSE)
