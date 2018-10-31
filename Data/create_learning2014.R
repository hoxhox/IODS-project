# Anna-Mari Hokkanen 31.10.18
# 2nd week assignment

#Reading the data from URL and exploring it
lrn2014<-read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", header = T)
dim(lrn2014)
str(lrn2014)
#It's a data frame of 183 rows and 60 columns

library(dplyr)

#Creating an analysis dataset
lrn2014$Attitude<-lrn2014$Attitude/10

deep<- c("Da","Db","Dc","Dd","De","Df","Dg","Dh","Di","Dj")
surface <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic<- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")


deep_columns <- select(lrn2014, one_of(deep))
lrn2014$deep <- rowMeans(deep_columns)
  
stra_columns<-select(lrn2014, one_of(strategic))
lrn2014$stra<-rowMeans(stra_columns)

surf_columns<-select(lrn2014, one_of(strategic))
lrn2014$surf<-rowMeans(surf_columns)  

#selecting the columns gender, age, attitude, deep, stra, surf and points 

keep_columns <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")
learning2014 <- select(lrn2014,one_of(keep_columns))

#excluding observations with 0 points
learning2014 <- filter(learning2014, Points >0)

#saving data to workspace
write.csv (learning2014,file="C:/Users/Anna-Mari/Desktop/IODS-project/learning2014.Rmd")

###################
#Graphics with learning2014

library(GGally)
library(ggplot2)

pairs(learning2014[-1], col=learning2014$gender)

p <- ggpairs(learning2014, mapping = aes(col=gender, alpha=0.3), lower = list(combo = wrap("facethist", bins = 20)))
p

#################
#Regression analysis

my_model <- lm(Points ~ Attitude, data = learning2014)
summary(my_model)

qplot(Attitude, Points, data = learning2014) + geom_smooth(method = "lm")

ggpairs(learning2014, lower = list(combo = wrap("facethist", bins = 20)))
my_model2 <- lm(Points ~ Attitude + stra + surf, data = learning2014)
my_model2
summary(my_model2)
