Lab2 = read.csv('/Users/mohamed/Downloads/lab2_proper.csv')
#Q1. 
# Apache Ant is a Java library and command-line tool whose mission is to drive processes described in build files as targets and extension points dependent upon each other.
# Jedit - Software text editor 
# Camel -Apache Camel is a Java-based Open Source framework for converting domains and for rule-based routing. 
# Ivy - package manager -  Ivy works to resolve project dependencies.

#MAXCC”represent the “maximum complexity” of all the methods in the class 
# “AVGCC”- “average complexity” of all the methods in the class.

#Q2. Mean, min, max, median of each system 
ant = Lab2[Lab2$Project == 'ant',]
mean(ant$MAXCC) # 3.849713
min (ant$MAXCC) # 0
max (ant$MAXCC)# 53
median(ant$MAXCC)#2 

mean (ant$AVGCC) #1.230346
min (ant$AVGCC)#0
max(ant$AVGCC)# 8.454545
median (ant$AVGCC)#1

jEdit = Lab2[Lab2$Project == 'jEdit',]
mean (jEdit$MAXCC)# 4.881732
min (jEdit$MAXCC)#0
max (jEdit$MAXCC)#167
median (jEdit$MAXCC)#2

mean (jEdit$AVGCC)#1.650024
min (jEdit$AVGCC)#0
max (jEdit$AVGCC) #28.66667
median (jEdit$AVGCC)#1

Camel = Lab2[Lab2$Project == 'camel',]
mean(Camel$MAXCC)#2.022378
min (Camel$MAXCC)#0
max (Camel$MAXCC)#33
median (Camel$MAXCC)#1

mean (Camel$AVGCC)#0.9151589
min (Camel$AVGCC)#0
max (Camel$AVGCC)#9.5
median (Camel$AVGCC)#0.8571429

Ivy = Lab2[Lab2$Project == 'ivy',]
mean (Ivy$MAXCC)#3.015005
min (Ivy$MAXCC)#0
max(Ivy$MAXCC)#29
median(Ivy$MAXCC)#1

mean (Ivy$AVGCC)#1.178112
min(Ivy$AVGCC)#0
max(Ivy$AVGCC)#8
median(Ivy$AVGCC)#1

#most complex = jEdit - highest MAXCC & AVGCC - because it a text editor
#least complex = camel 

# Q3. order set of classes in descending order and AVGCC and then take the top 5 classes from that list. 
# Jedit - different versions -of the system

#Q4. Order the set of classes on ascending order of AVGCC and again take the top 5 classes from that list. 
#1 = org.apache.tools.ant.Constants, it is class which defines constant only - holds no value 

#Q5. Produce a scatterplot of AVGCC versus MAXCC. 

plot(Lab2$MAXCC, Lab2$AVGCC) 
# produces 4 outliers - all Parser-based classes and all are in jEdit. 

#Q6. Draw a scatterplot of WMC versus AVGCC.
plot(Lab2$WMC,Lab2$AVGCC)
cor.test(Lab2$WMC,Lab2$AVGCC)#0.177987 - weak,number of methods in a class DOES NOT NECESSARILY mean that the class is complex! 
