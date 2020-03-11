#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title: Lugagge Weight Program
Description: Calculate whether a surcharge will be applied, 
            based on the weight of an airline passenger's luggage.
"""
def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    # START - Variables/Thinking process - Passengers allowed to have a maximum luggage weight 
    # of 50 lbs, any exceed will be surcharged 25$; Program collect the total luggage
    # weight the passengers
    luggSurch = 25.0
    luggLimit = 50.0
    luggWeight = 0.0
    #INPUT - Ask user the weight
    print("Welcome to the weight")
    luggWeight = float(input("Please enter the total weight of your luggage:"))
    #PROCESS AND OUTPUT - If > 50 lb, $25 surcharge is applied -> not Otherwise, no surcharge! 
    if luggWeight > luggLimit:
        print ("You exceeded the weight limit you will be surcharged: ${0}".format(luggSurch))
    else:
        print ("Your luggage is within the limit and wont be surcharged")
     
    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()