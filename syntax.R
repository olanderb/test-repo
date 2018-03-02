library(readxl)
library(dplyr)
library(anonymizer)
library(ggplot2)

#read in dataset using relative path
GIN <- read_excel("/test-repo/201801_GIN_EFSAdonneesbrutes.xlsx")

#use the anonymize function on "Interviewer Number" variable but it just creates values, how do i get it to replace the column Interveiwer Number?
thingy <- anonymize(GIN$`Interviewer Number`, .algo = "sha256")

#attaching the anonymized number to the dataset
GIN <- GIN %>% mutate(anonymizednumber = thingy)


#plots of number of members in household by sex of respondent
p10 <- ggplot(GIN, aes(x = sex, y = Nbre_membre)) + geom_boxplot()
print(p10)