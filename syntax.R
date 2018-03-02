library(readxl)
library(dplyr)
library(anonymizer)
library(ggplot2)

#read in the data set - how do i make this a relative path?
GIN <- read_excel("C:/test-repo/201801_GIN_EFSAdonneesbrutes.xlsx")


#trying how the anonymize function on "Operator" variable but it just creates values, how do i get it to replace the column Operator?
thingy <- anonymize(GIN$Operator, .algo = "sha256")

#trying some
GIN <- GIN %>% mutate(anonymizednumber = thingy)


#plots of FCS and rCSI
p10 <- ggplot(GIN, aes(x = sex, y = Nbre_membre)) + geom_boxplot()
print(p10)