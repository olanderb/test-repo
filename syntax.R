library(readxl)
library(dplyr)
library(anonymizer)
library(ggplot2)

#read in dataset using relative path
GIN <- read_excel("/test-repo/201801_GIN_EFSAdonneesbrutes.xlsx")

#trying how the anonymize function on "Operator" variable but it just creates values, how do i get it to replace the column Operator?
thingy <- anonymize(GIN$Operator, .algo = "sha256")

#attaching the anonymized number to the dataset
GIN <- GIN %>% mutate(anonymizednumber = thingy)


#plots of FCS and rCSI
p10 <- ggplot(GIN, aes(x = sex, y = Nbre_membre)) + geom_boxplot()
print(p10)