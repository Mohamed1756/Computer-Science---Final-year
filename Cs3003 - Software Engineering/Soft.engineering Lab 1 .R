table1 = read.csv('/Users/mohamed/Desktop/SELab1.csv', sep = ",")


boxplot(table1$No.of.bugs)
boxplot(table1$No.of.bugs, ylab='Number of Bugs', main="Boxplot distribution of the number of bugs found")

boxplot(table1$No.of.bugs~table1$Class, ylab='Number of Bugs', main="Boxplot distribution of the number of bugs found in each class")

boxplot(table1$Size.of.the.class..LOC., ylab='LOC', main="Boxplot distribution of the LOC")

median(table1$No.of.bugs)
median(table1$Size.of.the.class..LOC.)

# plot(table1$No.of.bugs,table1$Size.of.the.class..LOC., xlab = 'Number of bugs', ylab = 'LOC', main = "No of bugs vs. Size of the class (LOC)")


plot(table1$No.of.bugs,table1$Size.of.the.class..LOC.)
plot(table1$Size.of.the.class..LOC., table1$No.of.bugs)

plot(table1$No.of.bugs, table1$Size.of.the.class..LOC., xlab = 'Number of Bugs' , ylab = 'LOC', main = " No of bugs vs Line of Code")

cor.test(table1$Size.of.the.class..LOC., table1$No.of.bugs)

cor.test(table1$No.of.bugs, table1$Size.of.the.class..LOC.)

cor.test(table1$No.of.bugs, table1$Version)

cor.test(table1$Size.of.the.class..LOC.,table1$Version)
