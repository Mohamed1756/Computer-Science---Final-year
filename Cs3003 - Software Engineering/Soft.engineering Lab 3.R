Lab3 = read.csv('/Users/mohamed/Downloads/lab3_proper.csv')


#### Analysing Object-Oriented Metrics #######

#Q2. a)	Do classes with a high fan-in also have a high fan-out? 
plot(Lab3$fan.in,Lab3$fan.out) # no 
cor.test(Lab3$fan.in,Lab3$fan.out)# weak - 0.17

# b)	What is the relationship between fan-in and bugs?
plot(Lab3$fan.in , Lab3$bugs) #weak relationship - classes with lower fan in resulted in more bugs 
cor.test(Lab3$fan.in,Lab3$bugs)# 0.14

# c)	What is the relationship between fan-out and bugs? 
plot(Lab3$fan.out , Lab3$bugs)# positive relationship 
cor.test(Lab3$fan.out,Lab3$bugs) #0.47 

#This result suggests that classes which “use” a lot of other classes have a greater association with bugs
# than classes that “are used” by other classes. 

#Q3. a)	Is CBO strongly correlated to bugs? 
cor.test(Lab3$CBO,Lab3$bugs)#0.33 medium 
plot(Lab3$CBO,Lab3$bugs)

# b)	Is LCOM strongly correlated to bugs? 
cor.test(Lab3$LCOM,Lab3$bugs) #no 0.01

#c)	Is WMC strongly correlated to fan-in or fan-out? Comment on the result. 
cor.test(Lab3$WMC,Lab3$fan.in) #0.25
cor.test(Lab3$WMC,Lab3$fan.out) # 0.5 - strong.

# classes with fan in tend to be smaller compared to a fan - which is larger 
#It means that if we want to keep bugs low, then we should design classes which are firstly, 
#small and, secondly, do not have a high fan-out

# Explore MAXCC against the FIVE C&K metrics 
cor.test(Lab3$MAXCC,Lab3$CBO )#0.27
cor.test(Lab3$MAXCC,Lab3$WMC )#0.51- strongly related 
cor.test(Lab3$MAXCC,Lab3$DIT )#-0.08
cor.test(Lab3$MAXCC,Lab3$NOC )#0.11
cor.test(Lab3$MAXCC,Lab3$LCOM )#-0.01

#Q4. identify Outliers - top three highest values of bug,Compare with the three classes with the lowest number of bugs. 
#top 3 highest 
#1.EclipseFileManager, 2.Factory, 3.GeneratedFileManager$GeneratedPackageFragmentRoot

#Top 3 Lowest
# 1. A, A, A3

#File manager - manages files - vulnerable to more bugs - highest complexity 

#Q5. Exploring Relationship 
plot(Lab3$bugs, Lab3$MAXCC) # positive - bugs increase as MAXCC increases 
cor.test(Lab3$bugs, Lab3$MAXCC) #0.77
plot(Lab3$bugs, Lab3$AVCC) # weak positive  - no clear relation 
cor.test(Lab3$bugs, Lab3$AVCC) # 0.44

# this shows complexity and bugs are related. higher complexity = more bugs 

