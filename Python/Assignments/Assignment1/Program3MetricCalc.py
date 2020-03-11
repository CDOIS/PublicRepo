"""
Student Name: Ricardo Oliveira 
Program Title: Imperial to metric conversion 
Description: A program that converts the imperial to metric system
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    #Start point - Variables/Thinkin Process - Name variables, thinking the total numbers we will
    #need to get all the values needed for the user output;
    numberTonsImp = 0.0
    numberStone = 0.0
    numberPounds = 0.0
    numberOunces = 0.0
    metricTons = 0.0
    metricKilos = 0.0
    metricGrams = 0.0
    totalOunce = 0.0
    totalKilos = 0.0

    #WELCOME/User input
    print ("Welcome! \nThis is the Imperial-to-Metric Converter!\n")
    numberTonsImp = input("Enter the number of tons: " ) #5 HARD CODE TEST VALUE
    numberStone = input("Enter the number of stone: " ) #20 HARD CODE TEST VALUE
    numberPounds = input("Enter the number of pounds: " ) #2 HARD CODE TEST VALUE
    numberOunces = input("Enter the number of ounces: " ) #4 HARD CODE TEST VALUE
    
    #PROCESS - Math magic -FORMULAS NEED AN EXTRA PACE TO BREAK METRIC TONS TO KILOS AND GRAMS.
    totalOunce = (35840 * numberTonsImp) + (224 * numberStone) + (16 * numberPounds) + numberOunces
    totalKilos = (totalOunce / 35.274)
    metricTons = int(totalKilos / 1000)
    metricKilos =  totalKilos - (metricTons * 1000)
    metricGrams = (totalOunce * 28.34952) - (int(metricKilos) * 1000) - (int(metricTons) * 1000000)

    #RESULTS/User output/End point
    print ("The metric weight is {0:.0f} metric tons, {1:.0f} kilos, and {2:.1f} grams".format(metricTons, metricKilos, metricGrams))
    
    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()