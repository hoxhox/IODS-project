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

deep<-c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic<- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")


deep_columns <- select(lrn2014, one_of(deep))
deep_columns$sum<-rowMeans(deep_columns)
lrn2014$deep <- rowMeans(deep_columns)
  
stra_columns<-select(lrn2014, one_of(strategic))
lrn2014$stra<-rowMeans(stra_columns)

surf_columns<-select(lrn2014, one_of(surface))
lrn2014$surf<-rowMeans(surf_columns)  

#selecting the columns gender, age, attitude, deep, stra, surf and points 

keep_columns <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")
learning2014 <- select(lrn2014,one_of(keep_columns))

#excluding observations with 0 points
learning2014 <- filter(learning2014, Points >0)

#saving data to workspace
write.csv (learning2014,file="C:/Users/Anna-Mari/Desktop/IODS-project/learning2014.Rmd")

str(learning2014)


###################
#Graphics with learning2014

library(GGally)
library(ggplot2)

#Creating a plot showing the relationship between attitude and points 
p1 <- ggplot(learning2014, aes(x = Attitude, y = Points, col = gender))
p2 <- p1 + geom_point()
p2
p3 <- p2 + geom_smooth(method = "lm")
p4 <- p3 + ggtitle("Student's attitude versus exam points")
p4

#Function "pairs" draws scatter plots from the columns of a data frame, resulting in a scatter plot matrix

# draw a scatter plot matrix of the variables in learning2014.
# [-1] excludes the first column (gender)
pairs(learning2014[-1], col=learning2014$gender)



# create a more advanced plot matrix with ggpairs()
p <- ggpairs(learning2014, mapping = aes(col=gender, alpha=0.3), lower = list(combo = wrap("facethist", bins = 20)))
p



#################
#Regression analysis



my_model <- lm(Points ~ Attitude, data = learning2014)
summary(my_model)

qplot(Attitude, Points, data = learning2014) + geom_smooth(method = "lm")

#Multiple regression

ggpairs(learning2014, lower = list(combo = wrap("facethist", bins = 20)))
my_model2 <- lm(Points ~ Attitude + stra + surf, data = learning2014)
my_model2
summary(my_model2)



# learning2014, GGally, ggplot2 are avaiable

# create an plot matrix with ggpairs()
ggpairs(learning2014, lower = list(combo = wrap("facethist", bins = 20)))

# create a regression model with multiple explanatory variables
my_model2 <- lm(Points ~ Attitude + deep + surf + stra, data = learning2014)

# print out a summary of the model

summary(my_model2)
#Only Attitude has p<0.05. Thus removing "deep", "stra" and "surf" from the model
my_model3 <- lm(Points ~ Attitude, data = learning2014)
my_model3
summary(my_model3)


#Producing the following diagnostic plots: Residuals vs Fitted values, Normal QQ-plot and Residuals vs Leverage

# create a regression model with multiple explanatory variables
my_model2 <- lm(Points ~ Attitude + stra, data = learning2014)

# draw diagnostic plots using the plot() function. Choose the plots 1, 2 and 5 (residual vs fitted, normal q-q and residual vs leverage)
par(mfrow = c(2,2))
plot(my_model2, which = c(1,2,5))

