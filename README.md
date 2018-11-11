#output: github_document

#About the course IODS
#https://hoxhox.github.io/IODS-project/#about-the-project



#Week 2 submission

The data "Learning 2014" contains data collected from students with questionnaires, their gender, age, attitude towards the subject and exam points. The students, who haven't attended the exam, are excluded. Questions are divided by themes, and then a mean is calculated form each group. This way each student is given points to reflect the patients study habits in deep learning, strategic learning and stuctured learning.

A scatter plot is created to show the relationship between attitude, questionnaire answers and exam points. The attitude clearly correlates to exam points (p<0.05). The answers in the questionnaire don't have a correlation to exam points (p=0.46).


Diagnostic plots are created to assess the validity of the regression model in the data set. Residuals are plotted against the explanatory value. Here we see, that the residuals are scattered along a horizontal line, which implies, that the variance doesn't change with the explanatory variable. Thus the model seems appropriate. Also, the points in the normal Q-Q plot lie in y=x line, which shows us, that the 
distributions are linearly related. Cook's distance shows us, that there are no values with a high leverage. 