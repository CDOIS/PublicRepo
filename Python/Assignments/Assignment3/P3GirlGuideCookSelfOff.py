#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title: Girl Guide Cookie Sell-off
Description: Program to organize annual Girl Guide cookie sale - Notes the salesgirl, 
the number of boxes, and returns a full report of it
"""
#Function to check datatypes and gather the values from the user and return the lists;
def userGuideBoxes(p_numGuides):

    for count in range(0, p_numGuides): #Runs for the number of guides the user inputs
        while True:#Value Check
            nameGuide = input("Enter the name of guide #{}: ".format(count+1))
            if nameGuide.isalpha():
                nameBox.append(nameGuide)#EvenValues - Name of the guides
                break
            else:
                continue
            
        while True:#Value Check
            numberBox = input("Enter the number of boxes sold by {}: ".format(nameGuide))
            if numberBox.isnumeric():
                nameBox.append(int(numberBox))#OddValues - Number of boxes sold
                totalSales.append(int(numberBox))#SalesList - report oriented
                break
            else:
                continue
    return nameBox, totalSales #Return 2 lists

#Function to calculate average - same as p1
def averageCalc(p_numSales, p_maxSale):
    averageCalc = p_maxSale / p_numSales
    return averageCalc
       
#Variables initiation
totalSales = [] #Sales List - for final report
nameBox = [] #Names and Sales list - even=names; odd=sold boxes
#Below - prizes list
SalePrize = ["Trip to Girl Guide Jamboree in Aruba!", "Left over cookies", "Super Seller Badge", " "]
numGuides = 0 #Number of guides selling cookies;

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    
    #Welcome message and user input
    print("Welcome to the Girl Guide Cookie Sell-OFF Management!\n")
    while True:#ValueCheck
        numGuides = input("Enter the number of guides selling cookies: ")
        if numGuides.isnumeric():
            numGuides = int(numGuides) #Datatype conversion, if correct input
            break
        else:
            continue
        
    
    #Function call and values assignments
    nameBox, totalSales = userGuideBoxes(numGuides)
    averageSales = averageCalc(len(totalSales), sum(totalSales))
    maxSales = max(totalSales)
    
    #User output 
    print("\nThe average number of boxes sold by each guide was {0:.1f}.\n".format(averageSales))
    print("Guide:                               Prizes Won:")
    print("-------------------------------------------------------------")

    for count in range(0, len(nameBox),2): #Prize checking loop and correct assignment
        for counter in range(0,len(nameBox)):
            salesPrize = 0
            if int(nameBox[count+1]) == maxSales:
                salesPrize = SalePrize[0]
            elif int(nameBox[count+1]) > averageSales:
                salesPrize = SalePrize[2]
            elif int(nameBox[count+1]) >= 1 and int(nameBox[count+1]) <= averageSales:
                salesPrize = SalePrize[1]
            elif int(nameBox[count+1]) == 0:
                salesPrize = SalePrize[3]
            else:
                pass

        #Output - IMPOSSIBLE to make looks the same every time.
        print(nameBox[count]+"                               -"+salesPrize)
        
    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()