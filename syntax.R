library(readxl)
library(dplyr)
library(anonymizer)
library(ggplot2)


#Here's where I keep helpful stuff 

## use the anonymize function on "Interviewer Number" variable but it just creates values, how do i get it to replace the column Interveiwer Number?
data <- mutate(data, anonymizednumber = anonymize(VaribletoAnonymize, .algo = "sha256"))

#gets of all the wierd attribute/label stuff when imported a spss file and simples outputs as character 
remove_attributes <- function(x) {
  attr(x, "label") <- NULL
  attr(x, "format.spss") <- NULL
  attr(x, "display_width") <- NULL
  x
}

newdata <- olddata %>% mutate_if(is.labelled, ~ as.character(as_factor(.x))) %>%
  mutate_all(funs(remove_attributes))

#function to proper case 
capwords <- function(s, strict = FALSE) {
  cap <- function(s) paste(toupper(substring(s, 1, 1)),
                           {s <- substring(s, 2); if(strict) tolower(s) else s},
                           sep = "", collapse = " " )
  sapply(strsplit(s, split = " "), cap, USE.NAMES = !is.null(names(s)))
}

#replace weird characters 
data$variable <- chartr("é", "e", data$variable)       
                           
#recode variables
data$variable[data$variable=oldvalue] <- newvalue                       
                           
#rename variables
colnames(data)[colnames(data)=="oldvariable"] <- "newvariable"
                           
