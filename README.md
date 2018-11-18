#output: github_document

#About the course IODS
#https://hoxhox.github.io/IODS-project/#about-the-project



#Week 2 submission

The data "Learning 2014" contains data collected from students with questionnaires, their gender, age, attitude towards the subject and exam points. The students, who haven't attended the exam, are excluded. Questions are divided by themes, and then a mean is calculated form each group. This way each student is given points to reflect the patients study habits in deep learning, strategic learning and stuctured learning.

A scatter plot is created to show the relationship between attitude, questionnaire answers and exam points. The attitude clearly correlates to exam points (p<0.05). The answers in the questionnaire don't have a correlation to exam points (p=0.46).


Diagnostic plots are created to assess the validity of the regression model in the data set. Residuals are plotted against the explanatory value. Here we see, that the residuals are scattered along a horizontal line, which implies, that the variance doesn't change with the explanatory variable. Thus the model seems appropriate. Also, the points in the normal Q-Q plot lie in y=x line, which shows us, that the 
distributions are linearly related. Cook's distance shows us, that there are no values with a high leverage, that is no significant outliers, that would distort the regression analysis result.

#Week 3 submission
Student questionnaire
math<-read.table(C:\Users\Anna-Mari\Desktop\IODS-project\Data\student-mat.csv)

The data contains information of portuguese students. Their demographic and socioeconomic situation is recorded. Also the use of alcohol and data collected from questionnaires is recorded. The information is combined from sudents, who have conducted the questionnary in theri portuguese and math class.

The data is used to explore the following hypotheses:

H1 Students who have high alcohol consumption, have more absences
H2 alchohol consumption is higher among older students
H3 alchohol consumption decreases as studytime increases
H4 alchohol comsumption is highgest among the students, who have most school absence

H1: a boxplot showing the connection between alcohol consumption and absences is drawn and a logistic model is conducted. Students with high alcohol use have more absences (p<0.05). 

H2: a boxplot and linear logistic model shows, that age and sex effect the odds of high alcohol consumption (p<0.05)

H3: Alcohol comsumption isn't higher among students, who study less. Among female, ths study time is even shorter among students, who consume less alcohol.

H4: Surprisingly, students who use more alcohol, have less failures.
 
