SE_Lab4= read.csv('/Users/mohamed/Desktop/lab4_proper.csv', sep =',')

#find difference in coupling (e.g., CBO) between classes with line and branch 
cor.test(SE_Lab4$CBO, SE_Lab4$line_coverage....)

cor.test(SE_Lab4$CBO, SE_Lab4$branch_coverage....)

cor.test(SE_Lab4$CBO, SE_Lab4$fan.in)
cor.test(SE_Lab4$CBO, SE_Lab4$fan.out)

# Q2. relationship between (CC) and classes with line and branch coverage <=50%? Compare your result with classes where line and branch coverage =100%. 

cor.test (SE_Lab4$CC <=50, SE_Lab4$line_coverage....<=50)

cor.test (CC50, LC50)

CC50 = SE_Lab4$CC [SE_Lab4$CC <= 50]
LC50 = SE_Lab4$line_coverage.... [SE_Lab4$line_coverage.... <=50]

#Q3. Determine the relationship between Changes and line and branch coverage. 

cor.test(SE_Lab4$Changes, SE_Lab4$line_coverage....)
plot(SE_Lab4$Changes, SE_Lab4$line_coverage....)

cor.test(SE_Lab4$Changes, SE_Lab4$branch_coverage....)
plot(SE_Lab4$Changes, SE_Lab4$branch_coverage....)

