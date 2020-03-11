#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name:    
Program Title:  
Description:    
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!

    #Variables?
    luggageWeight = 0.0    #string or int or float?
    surchargeAmount = 30.0    #float
    weightLimit = 50

    #INPUTS - 1 input! Weight of luggage
    print("This is the Luggage Calculatron")
    print("If your luggage weighs more than {} lbs, you will be OVERCHARGED!".format(weightLimit))

    luggageWeight = float(input("Enter the weight of your luggage: "))

    #PROCESSING - If > $50 lbs, $25 surcharge is applied
    #           - Otherwise, no surcharge, yay!     (Else?)
    print("Your luggage weight has been calculated.")

    if luggageWeight > weightLimit:
        print("Weight limit exceeded! ${:.0f} surcharge applied!".format(surchargeAmount))
        #print("Weight limit exceeded! $" + str(surchargeAmount) + " surcharge applied!")
    # else:
    #     print("Weight was good. No surcharge!")

    print("Thank you for flying GIllespie Airlines.")
    # if luggageWeight <= weightLimit:
    #     print("No surcharge applied")


    #OUTPUTS  Message to user indicating whether they were charged a surcharge  

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()