#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title: Wage Calculator If/else 
Description: Calculates wages and overtime pays    
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    overtimeRate = 1.5
    workLoad = 40
    payperHour = 0.0
    workedHours = 0.0
    regularHours = 0.0
    totalPay = 0.0
    totalextraPay = 0.0
    extraHourpay = 0.0
    extraHourWork = 0
    #START - USER DATA INPUT
    print ("Welcome to the WAGE Calc!\n")   
    payperHour = float(input("Please input your pay rate per hour:"))
    workedHours = float(input("Please input the number of hours you worked:"))
    regularHours = workedHours
    #MATH - 
    if workedHours > workLoad:
        extraHourpay = (payperHour * overtimeRate)
        extraHourWork = (workedHours - workLoad)
        totalextraPay = extraHourWork * extraHourpay
        regularHours = (workedHours - extraHourWork)
                
    #END - OUTPUT RESULTS
    totalPay = (payperHour * regularHours) + totalextraPay
    print("Your total pay is {0:.2f}".format(totalPay))

#Do not change any of the code below!
if __name__ == "__main__":
    main()