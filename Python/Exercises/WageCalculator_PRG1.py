#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name:    
Program Title:  
Description:    
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!

    #1. Welcome msg
    print("This is the Wage Calculator")

    #1A. Variables
    workHoursInAWeek = 40
    otRate = 1.5

    rateOfPay = 0.0    #float   U
    numOfHours = 0.0       #float   U
    regularHours = 0.0      #float  C
    overtimeHours = 0.0     #float  C
    overTimePay = 0.0       #float  C
    totalPay = 0.0          #float  C
    
    #2. Ask user for rate of pay and num of hours worked this week (Need to cast?)
    rateOfPay = float(input("What is your hourly wage? "))
    numOfHours = input("How many hours did you work this week?")

    regularHours = float(numOfHours)

    #3. Use #hours to determine if there was OT
    if float(numOfHours) > workHoursInAWeek:
        print("OT!")

    #4. IF OT, we need to calc OT pay and add to total
        overtimeHours = float(numOfHours) - workHoursInAWeek
        overTimePay = overtimeHours * rateOfPay * otRate
    
    totalPay = rateOfPay * (regularHours - overtimeHours) + overTimePay
    
    #5. If there's NO OT, just calc the total using regular rate


    #6. Do the math:
    #   - Reg time, pay * hours
    #   - OT    pay * hours * 1.5


    #7. Output final total to screen
    print(totalPay)


    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()