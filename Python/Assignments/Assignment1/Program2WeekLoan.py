"""
Student Name: Ricardo Oliveira 
Program Title: Weekly loan calculator
Description: A program to keep finances in check  
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    #Start point - Variables/Thinkin Process - Name variables, thinking the total numbers we will
    #need to get all the values needed for the user output;
    amountBorrow = 0.0
    interestRate = 0.0
    durationYears = 0
    weekPayments = 0.0
    weeklyInterest = 0.0

    #WELCOME/User input
    print ("Weekly Loan Calculator!\nKeep Finances in check!")
    
    amountBorrow = float(input("\nEnter the amount of loan:")) #hard code test - 15000
    interestRate = float(input("\nEnter the interest rate (%):")) #hard code test - 3.6
    durationYears = float(input("\nEnter the number of years:")) #hard code test - 5
    
    #PROCESS - Math magic
    weeklyInterest = interestRate / 5200
    weekPayments = (weeklyInterest / (1 - (1 + weeklyInterest) ** (-52 * durationYears)) * amountBorrow)

    #RESULTS/User output/End point
    print ("Your weekly payment will be: ${0:.2f}".format(weekPayments))

    

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()