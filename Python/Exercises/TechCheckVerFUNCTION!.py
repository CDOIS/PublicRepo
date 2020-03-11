#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title: Grade Point Calculator
Description: A program that calculates the grades of a course;
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    #Thinking Process - variables - decisions -> GRADE VALUES
    valueA = 4 
    valueB = 3
    valueC = 2
    valueD = 1
    valueF = 0
    grdA = "A"
    grdB = "B"
    grdC = "C"
    grdD = "D"
    grdF = "F"
    usrGrd = ""
    usrMod = ""
    modPlus = "+"
    modMinus = "-"
    modNoth = ""
    modValplus = 0.3
    modValminus = -0.3
    modValnoth = 0
    gradeTotal = 0.0
    #WELCOME SCREEN/USER INPUT AND LOTS, LOTS OF DECISIONS!
    print("Welcome to the Grade Point Calculator!")
    print("Valid letter grades input: A, B, C, D and F.")
    print("Valid grade modifier +, - or nothing.")
    print("All letter grades except F can include a + or - symbol.")
    print("Calculated grade point value cannot exceed 4.0.")
    usrGrd = input("Please enter a letter grade: ")    
    usrMod = input("Please enter a modifier (+, - or nothing): ")
    if usrMod == modPlus:
        usrMod = modValplus
    elif usrMod == modMinus:    
        usrMod = modValminus
    elif usrMod == modNoth:
        usrMod = modValnoth
    if usrGrd.upper() == grdA:
        usrGrd = valueA
    elif usrGrd.upper() == grdB:
        usrGrd = valueB
    elif usrGrd.upper() == grdC:
        usrGrd = valueC
    elif usrGrd.upper() == grdD:
        usrGrd = valueD
    elif usrGrd.upper() == grdF:
        usrGrd = valueF
    else: #INVALID USER INPUT!
        print("You entered an invalid letter grade.")
        usrGrd = valueF #ATTRIBUTE TO 0 NUMERIC VALUE ANSWER
    gradeTotal = usrGrd + usrMod
    if gradeTotal > valueA: #CHECK AND FIX IF THE VALUE IS OVER THE MAX
        gradeTotal = valueA
    elif gradeTotal < valueF: #CHECK AND FIX IF THE VALUE IS UNDER THE MIN
        gradeTotal = valueF
    print("The numeric value is: {0:.1f}".format(gradeTotal)) #OUTPUT TO USER

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()