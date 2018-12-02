<<<<<<< HEAD
<<<<<<< HEAD

load(plyr)
library(dplyr)
library(ggplot2)

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

str(hd)
dim(hd)



gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
str(gii)
dim(gii)

#Renaming

names(hd)[names(hd)=="Human.Development.Index..HDI.   "] <- "HDI"
names(hd)[names(hd)=="Life.Expectancy.at.Birth   "] <- "LifeExp"
names(hd)[names(hd)=="Expected.Years.of.Education   "] <- "EduExp"
names(hd)[names(hd)=="Mean.Years.of.Education   "] <- "MeanExp"
names(hd)[names(hd)=="Gross.National.Income..GNI..per.Capita  "] <- "GNI"
names(hd)[names(hd)=="GNI.per.Capita.Rank.Minus.HDI.Rank   "] <- "GNIminusHDI"

names(gii)[names(gii)=="Gender.Inequality.Index..GII.   "] <- "GII"
names(gii)[names(gii)=="Percent.Representation.in.Parliament     "] <- "Parl"
names(gii)[names(gii)=="Population.with.Secondary.Education..Female   "] <- "SecFemale"
names(gii)[names(gii)=="Population.with.Secondary.Education..Male   "] <- "SecMale"
names(gii)[names(gii)=="Labour.Force.Participation.Rate..Female  "] <- "LabFemale"
names(gii)[names(gii)=="Labour.Force.Participation.Rate..Male.        "] <- "LabMale"

#Creating a new variable

gii <- mutate(gii, edugender = (SecFemale. /  SecMale))
gii <- mutate(gii, labgender = (LabFemale. /  LabMale ))
              
#Joining the datasets by variable "country"

human <- inner_join(hd, gii, by = "Country")

read.table(human, "C:\Users\Anna-Mari\Desktop\IODS-project1")
=======

load(plyr)
library(dplyr)
library(ggplot2)

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

str(hd)
dim(hd)


rename(hd, c(HDI.Rank =hdi.rank, Country=country,  Human.Development.Index..HDI.=hdi, Life.Expectancy.at.Birth   =life.exp,  Expected.Years.of.Education=exp.eduyr, Mean.Years.of.Education  =mean.eduyr, Gross.National.Income..GNI..per.Capita =GNI,  GNI.per.Capita.Rank.Minus.HDI.Rank  =GNI-HDI))      

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
str(gii)
dim(gii)

#Creating a new variable

gii <- mutate(gii, edugender = (Population.with.Secondary.Education..Female. /  Population.with.Secondary.Education..Male.))
gii <- mutate(gii, labgender = (Labour.Force.Participation.Rate..Female. /  Labour.Force.Participation.Rate..Male. ))
              
#Joining the datasets by variable "country"

human <- inner_join(hd, gii, by = "Country")

read.table(human, "C:\Users\Anna-Mari\Desktop\IODS-project1")
>>>>>>> 540139ece27ae70179455e1f2eaf9ea0e3444e6e
=======

load(plyr)
library(dplyr)
library(ggplot2)

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

str(hd)
dim(hd)


rename(hd, c(HDI.Rank =hdi.rank, Country=country,  Human.Development.Index..HDI.=hdi, Life.Expectancy.at.Birth   =life.exp,  Expected.Years.of.Education=exp.eduyr, Mean.Years.of.Education  =mean.eduyr, Gross.National.Income..GNI..per.Capita =GNI,  GNI.per.Capita.Rank.Minus.HDI.Rank  =GNI-HDI))      

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
str(gii)
dim(gii)

#Creating a new variable

gii <- mutate(gii, edugender = (Population.with.Secondary.Education..Female. /  Population.with.Secondary.Education..Male.))
gii <- mutate(gii, labgender = (Labour.Force.Participation.Rate..Female. /  Labour.Force.Participation.Rate..Male. ))
              
#Joining the datasets by variable "country"

human <- inner_join(hd, gii, by = "Country")

read.table(human, "C:\Users\Anna-Mari\Desktop\IODS-project1")
>>>>>>> 540139ece27ae70179455e1f2eaf9ea0e3444e6e
