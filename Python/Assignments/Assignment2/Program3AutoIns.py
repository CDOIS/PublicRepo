#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title: Auto Insurance Calc
Description: A program that checks the biologic sex, age of the user and rate accordingly, with pre-fixed table
"""
#Functions definitions -> Accordingly with the usr gender check, runs the specifications fixed
#Calculates and returns the final value to the output
def maleTable(p_usrAge, p_usrVehprc):
    vehPr1rng = 0.25
    vehPr3rng = 0.17
    vehPr5rng = 0.10
    pdYr = 12
    frstAgrng = 15
    scndAgrng = 25
    trdAgrng = 40
    fnlAgrng = 70
    if p_usrAge >= frstAgrng and p_usrAge < scndAgrng:
        mnthInsrnc = (p_usrVehprc * vehPr1rng) / pdYr
    elif p_usrAge >= scndAgrng and p_usrAge < trdAgrng:
        mnthInsrnc = (p_usrVehprc * vehPr3rng) / pdYr
    elif p_usrAge >= trdAgrng and p_usrAge < fnlAgrng:
        mnthInsrnc = (p_usrVehprc * vehPr5rng) / pdYr
    return mnthInsrnc

def femaleTable(p_usrAge, p_usrVehprc):
    vehPr2rng = 0.20
    vehPr4rng = 0.15
    vehPr5rng = 0.10
    pdYr = 12
    frstAgrng = 15
    scndAgrng = 25
    trdAgrng = 40
    fnlAgrng = 70
    if p_usrAge >= frstAgrng and p_usrAge < scndAgrng:
        mnthInsrnc = (p_usrVehprc * vehPr2rng) / pdYr
    elif p_usrAge >= scndAgrng and p_usrAge < trdAgrng:
        mnthInsrnc = (p_usrVehprc * vehPr4rng) / pdYr
    elif p_usrAge >= trdAgrng and p_usrAge < fnlAgrng:
        mnthInsrnc = (p_usrVehprc * vehPr5rng) / pdYr
    return mnthInsrnc
def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    #Start - variables initializing, I/O and fixed global values
    usrBlgcGndr = ""
    usrAge = 0
    usrVehprc = 0.0
    blgcGndr1 = "Male"
    blgcGndr2 = "Female"
    mnthInsrnc = 0.0     
    #Welcome/User Input - Ask the user the data input
    usrBlgcGndr = input("Are you 'Male' or 'Female': ")
    usrAge = int(input("Enter your age: "))
    usrVehprc = float(input("Enter the purchase price of the vehicle: "))
    #Checking process - and call the specific function for that;
    if usrBlgcGndr.capitalize() == blgcGndr1:
        mnthInsrnc = maleTable(usrAge, usrVehprc)
    elif usrBlgcGndr.capitalize() == blgcGndr2:
        mnthInsrnc = femaleTable(usrAge, usrVehprc)        
    #Program end/User output - Return the information to the user
    if mnthInsrnc == 0:
        print("You entered an incorrect information, please start again.")
        main()
    else:
        print("Your monthly insurance will be: ${0:.2f}".format(mnthInsrnc))
    #Your code ends on the line above
#Do not change any of the code below!
if __name__ == "__main__":
    main()