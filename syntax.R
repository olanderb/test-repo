library(readxl)
library(dplyr)
library(anonymizer)

#read in the data set
GIN <- read_excel("C:/Users/Catharine/Desktop/VAMSPSSTEST_201801_GIN_EFSA/1_Données Brutes/201801_GIN_EFSAdonneesbrutes.xlsx")

#trying how the anonymize function on "Operator" variable but it just creates values, how do i get it to replace the column Operator?
thingy <- anonymize(GIN$Operator, .algo = "sha256")

#trying some
GIN <- GIN %>% mutate(anonymized_name = thingy)