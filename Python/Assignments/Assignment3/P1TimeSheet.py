#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title: TimeSheet
Description: Program to Calculate the workload of the user
"""

#Function to calculate average and return the value
def averageCalc(p_lenght, p_maxval):
    averageCalc = p_maxval / p_lenght
    return averageCalc

#Function to calculate the and print the specific line if the worked hours aren`t met
def slackFunction(p_Len, workedHours):
    slackoff = 7
    for count in range(p_Len): #Loop to check for if there are any slack
        if workedHours[count] < slackoff:
            slackindex = count + 1
            slackHours = workedHours[count]
            print("Day #{0}: {1} hours".format(slackindex, slackHours))
    
workedHours = [] #List to hold the worked hours
daysWork = 5 #Variable that holds the # of worked days

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    
    #Program start - User input - LOOP to ask the user input
    print("Welcome to the Time Sheet Calculator")
    for myCounter in range (0, daysWork):
        while True: #Loop to check datatype
            userWHours = input("Enter hours worked on Day #{}: ".format(myCounter+1))
            if userWHours.isnumeric():
                workedHours.append(float(userWHours))
                break
            else:
                print("Please enter the number of hours worked.")
    
    #Function call and returned value assign
    averageHours = averageCalc(len(workedHours), sum(workedHours))
   
    #Output description
    print("----------------------------------------------------------")
    print("The most hours workd was on:")
    maxWork = max(workedHours) #MaxValue of the list - for the loop check
    
    #Loop to check and output the most worked days/hours
    for workaholic in range(0, len(workedHours)): 
        if workedHours[workaholic] >= maxWork:
            print("Day #{0} when you worked {1}".format((workaholic+1), workedHours[workaholic]))
    print("----------------------------------------------------------")
    print("The total number of hours worked was {0}".format(sum(workedHours)))
    print("The Average number of hours worked each day was: {0}".format(averageHours))
    print("----------------------------------------------------------")
    print("Days you slacked off (i.e. worked less than 7 hours):")
    
    #Function call to print the worked hours not met;
    slackFunction(len(workedHours), workedHours) 

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()   