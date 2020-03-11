#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title: Landscape Calculator
Description: A program that computes the price of landscaping considering 
            some criteria
"""
#grassCalc- Check the type of grass input and set it`s correct value;
#Functions - Checking and Math;
def grassCalc(p_usrGrass):
    grassType1 = "fescue"
    grassType2 = "bentgrass"
    grassType3 = "campus"
    grassFescue = 0.05
    grassBent = 0.02
    grassCampus = 0.01
    if p_usrGrass.lower() == grassType1:
        grassCost = grassFescue
    elif p_usrGrass.lower() == grassType2:
        grassCost = grassBent
    elif p_usrGrass.lower() == grassType3:
        grassCost = grassCampus
    return grassCost
#costCalc - Calculate total area, check if it occur the extra charge, check number of trees
#Calculate the final cost and return the value for the variable in the output;
def costCalc(p_usrDepth, p_usrWidth, p_grassCost, p_usrTrees):
    surfaceLimit = 5000
    surfaceOprice = 500
    sqFeet = 0.0
    surfaceCost = 0.0
    labCharge = 1000
    treeCost = 100
    sqFeet = p_usrDepth * p_usrWidth
    if sqFeet > surfaceLimit:
        surfaceCost = surfaceOprice
    else:
        pass    
    if p_usrTrees != 0:
        sqFeetCost = (sqFeet * p_grassCost) + surfaceCost + labCharge + (p_usrTrees * treeCost) 
    else:
        sqFeetCost = (sqFeet * p_grassCost) + surfaceCost + labCharge
    return sqFeetCost
def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    #Program Start - Variables initiation - fixed global values and the I/O variables;
    usrHouse = 0
    usrDepth = 0
    usrWidth = 0
    usrGrass = ""
    usrTrees = 0    
    sqFeetCost = 0.0
    grassCost = 0.0   
    #Welcome and ask the user to input the values;
    print("Welcome to the Landscape Calc!\n")
    usrHouse = int(input("Enter House Number: "))
    usrDepth = int(input("Enter property depth(feet): "))
    usrWidth = int(input("Enter property width(feet): "))
    usrGrass = input("Enter type of grass (fescue, bentgrass, campus): ")
    usrTrees = int(input("Enter the number of trees: "))
    #Processing - Function Calls;
    grassCost = grassCalc(usrGrass)
    sqFeetCost = costCalc(usrDepth, usrWidth, grassCost, usrTrees)
    #Program end - User Output;
    print("\nHouse Number: {0}".format(usrHouse))
    print("Property depth: {0}".format(usrDepth))
    print("Property width: {0}".format(usrWidth))
    print("Type of grass: {0}".format(usrGrass.capitalize()))
    if usrTrees != 0: #Check if needed to print "number of trees ordered";
        print("Number of trees ordered: {0}".format(usrTrees))
    print("\nTotal cost for house {0} is: ${1}".format(usrHouse, sqFeetCost))
    #Your code ends on the line above
#Do not change any of the code below!
if __name__ == "__main__":
    main()