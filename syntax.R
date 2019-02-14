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

#gets of all the wierd attribute/label stuff when imported a spss file and simples outputs as character 
newdata <- olddata %>% mutate_if(is.labelled, ~ as.character(as_factor(.x))) %>%
  mutate_all(funs(remove_attributes))

#function to proper case 
capwords <- function(s, strict = FALSE) {
  cap <- function(s) paste(toupper(substring(s, 1, 1)),
                           {s <- substring(s, 2); if(strict) tolower(s) else s},
                           sep = "", collapse = " " )
  sapply(strsplit(s, split = " "), cap, USE.NAMES = !is.null(names(s)))
}

#replace 
data$variable <- chartr("é", "e", data$variable)                           
