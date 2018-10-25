library(readxl)
library(dplyr)
library(anonymizer)
library(ggplot2)

#read in dataset using relative path
GIN <- read_excel("./201801_GIN_EFSAdonneesbrutes.xlsx")

## Check data type
glimpse(GIN)


## use the anonymize function on "Interviewer Number" variable but it just creates values, how do i get it to replace the column Interveiwer Number?
GIN <- mutate(GIN, anonymizednumber = anonymize(`Interviewer Number`, .algo = "sha256"))
glimpse(GIN)

## Check the data
View(select(GIN, anonymizednumber, `Interviewer Number`))

#plots of number of members in household by sex of respondent
p10 <- ggplot(GIN, aes(x = sex, y = Nbre_membre)) +
  geom_boxplot()
print(p10)

#exports SPSS value label instead of value names
data %>%  mutate_if(is.labelled, as_factor) %>% ## turn label to text (i.e factor)
  write_csv("data.csv")
