#Anna-Mari Hokkanen 11.11.18
#Student questionnaires
#math<-read.table(C:\Users\Anna-Mari\Desktop\IODS-project\Data\student-mat.csv)

url <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets"

# web address for math class data
url_math <- paste(url, "student-mat.csv", sep = "/")


# read the math class questionaire data into memory
math <- read.table(url_math, sep = ";" , header=TRUE)

# web address for portuguese class data
url_por <- paste(url, "student-por.csv", sep ="/")


# read the portuguese class questionaire data into memory
por <- read.table(url_por, sep = ";", header = TRUE)

#selecting the students present in both datasets
library(dplyr)

# Selecting the variables neede for pasting
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")

# join the two datasets by the selected identifiers
math_por <- inner_join(math, por, by = join_by)

str(math_por)

# create a new data frame with only the joined columns
alc <- select(math_por, one_of(join_by))

# columns that were not used for joining the data
notjoined_columns <- colnames(math)[!colnames(math) %in% join_by]

# print out the columns not used for joining
notjoined_columns

# for every column name not used for joining...
for(column_name in notjoined_columns) {
  # select two columns from 'math_por' with the same original name
  two_columns <- select(math_por, starts_with(column_name))
  # select the first column vector of those two columns
  first_column <- select(two_columns, 1)[[1]]
  
  # if that first column  vector is numeric...
  if(is.numeric(first_column)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    alc[column_name] <- round(rowMeans(two_columns))
  } else { # else if it's not numeric...
    # add the first column vector to the alc data frame
    alc[column_name] <- first_column
  }
}

# define a new column alc_use by combining weekday and weekend alcohol use
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)

# save(elake_etk,file="L:/ETK/2017/elake_etk2017.Rdata")

#saving to Data -folder
write.csv(alc, file = "C:Users/Anna-Mari/Desktop /IODS-project /alc.data.Rdata")

?write.csv 

#Sukupuoli 0=male, 1=female
alc$sex<-ifelse(alc$sex=="F", 1, 0)


str(alc$sex)
###############################
#Hypotheses
#H1 Students who have high alcohol consumption, have more absences
#H2 alchohol consumption is higher among older students
#H3 alchohol consumption decreases as studytime increases
#H4 alchohol comsumption is highgest among the students, who have most school absence


library(dplyr)
library(ggplot2)


# initialize a plot of alcohol use
g1 <- ggplot(data = alc, aes(x = high_use, fill = sex))
# define a new logical column 'high_use'
alc <- mutate(alc, high_use = alc_use > 2)

# define the plot as a bar plot and draw it
g1 + geom_bar()
colnames(alc)


# initialize a plot of 'high_use'
g2 <- ggplot(alc, aes(high_use))

# draw a bar plot of high_use by sex
g2 + facet_wrap("sex") + geom_bar()

m3 <- glm(high_use ~ sex, data = alc, family = "binomial")
summary(m2)

#############################################################


#H1 Students who have high alcohol consumption, have more absences

g1 <- ggplot(alc, aes(x = high_use, y = absences, col = sex))

# define the plot as a boxplot and draw it
g1 + geom_boxplot() + ggtitle("Student absences by alcohol consumption and sex")

#Logistic regression model of high alcohol use and absences
m1 <- glm(high_use ~ absences, data = alc, family = "binomial")
summary(m1)

#students with high alcohol use have more absences (p<0.05). 



####################
#H2:  alchohol consumption is higher among older students
# initialize a plot of high_use and age
g2 <- ggplot(alc, aes(x = high_use, y = age, col = sex))

# define the plot as a boxplot and draw it
g2 + geom_boxplot() + ylab("age")

# initialise a plot of high_use and age
g2 <- ggplot(alc, aes(x = high_use, y = age, col = sex))

# define the plot as a boxplot and draw it
g2 + geom_boxplot() + ggtitle("Alcohol consumption by age and sex")

#Alcohol consumption decreases by age in female, but increasest in male. 
# Logistic regression model
m2 <- glm(high_use ~ age + sex, data = alc, family = "binomial")

summary(m2)
#Linear logistic model shows, that age and sex effect the odds of high alcohol consumption (p<0.05)

###################
#H3 alcohol consuption decreases as study time increases


# plot of high_use and studytime
g3 <- ggplot(alc, aes(x = high_use, y = studytime, col = sex))

# define the plot as a boxplot and draw it
g3 + geom_boxplot() + ggtitle("Alcohol consumption by studytime")

#Alcohol comsumption isn't higher among students, who study less. Among female, ths study time is even shorter among students, who consume less alcohol

################
#H4 students who consume more alcohol, have more failures

g4 <- ggplot(data = alc, aes(x = high_use, fill = failures))

g4 <- ggplot(alc, aes(x = high_use, y = failures, col = sex))
g4 + geom_bar() + ylab("failures")

# plot of high_use and failures
g4 <- ggplot(alc, aes(x = high_use, y = failures, col = sex))

# define the plot as a boxplot and draw it
g4 + geom_boxplot() + ggtitle("Alcohol consumption by failures")

m <- glm(high_use ~ failures, data = alc, family = "binomial")
summary(m)

#Students, who use more alcohol, have less failures.
