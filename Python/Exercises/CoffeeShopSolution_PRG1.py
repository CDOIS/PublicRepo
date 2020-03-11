#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Geoff   
Program Title:  Coffee Shop
Description:   Program to ask user for # of cups of coffee, calculates price with tax 
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!

    #1. Start program with welcome/instructions messages

    print("Welcome to \"Geoff's\" Coffee Shop!")
    print("We sell premium coffee at $1.25 per cup.\n")

    #3. Define some variables we might need (price of coffee, taxRate)
    priceOfCoffee = 1.25
    taxRate = 1.15
    numOfCups = 0   #int
    total = 0.0  #float   <-- Variable initialization

    #4. Prompt user for # of cups
    userValueCups = input("How many cups of coffee would you like to purchase?: ")

    #5. Cast string user gave me?
    numOfCups = int(userValueCups)

    #6. Do the math
    total = numOfCups * priceOfCoffee * taxRate

    #7. Output final answer
    #round(numToRound, numOfDecimals)
    roundedTotal = round(total, 2)
    print("\nYou bought" + " " + userValueCups + " cups of coffee." + " Your total is: $" + str(roundedTotal))

    #print("You bought ", userValueCups,  " cups of coffee." , " Your total is: $" , str(roundedTotal))

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()