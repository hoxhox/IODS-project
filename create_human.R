
load(plyr)

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

str(hd)
dim(hd)


rename(hd, c(HDI.Rank =hdi.rank, Country=country,  Human.Development.Index..HDI.=hdi, Life.Expectancy.at.Birth   =life.exp,  Expected.Years.of.Education=exp.eduyr, Mean.Years.of.Education  =mean.eduyr, Gross.National.Income..GNI..per.Capita =GNI,  GNI.per.Capita.Rank.Minus.HDI.Rank  =GNI-HDI))      

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
str(gii)
dim(gii)
