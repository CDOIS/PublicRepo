#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name:    Geoff 
Program Title:  Online Store (Complex decisions exercise)
Description:    Enter total and country. If Canada, calculate and taxes based on province. Otherwise, no tax applied.
                Exercise to demonstrate the usage of different decision structures (if, if-else, elif, and/or usage)
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!

    #Variables
    AB_TaxRate = 1.05
    ON_NS_NB_TaxRate = 1.15
    NStaxRate = 1.15
    other_TaxRate = 1.11

    #Set an initial total, will be overwritten when we get a value from user and/or calculate taxes
    finalTotal = 0.0

    print("Online Store Program")

    #Gather user inputs (purchase amount and country)
    finalTotal = float(input("Enter the total of your purchase: $"))
    country = input("Please enter your country: ").upper()

    #Determine which country was entered, to decide whether to apply taxes
    if country == "CANADA":     #Canada (calc tax))
        #Since user is from Canada, we need the province to determine which tax rate to use.
        province = input("Which province are you from? ")

        if province.lower() == "alberta":   #5%     Uses .lower() on input, to ensure user-entered value matches the casing in our comparison string
            #Order amount mult. by AB tax rate
            finalTotal = finalTotal * AB_TaxRate
            #print("Your final total is ${:.2f}".format(finalTotal))    #ORIGINAL CODE: We started by having the print statement in all three logical branches
                                                                        #Later, we determined it was redundant, since we ALWAYS want to print a total, so we 
                                                                        #moved the print OUTSIDE the province decision structure (to line 51)

        #elif province.lower() == "ontario" or "nova scotia" or "new brunswick": #Don't forget: Boolean conditions must evaluate as either true or false. In this
                                                                                #initial version, we are not doing valid Boolean comparisons.
                                                                                #Python evaluates primitive values as TRUE, if it's not a valid Boolean expression/value
                                                                                
        elif province.lower() == "ontario" or province.lower() == "nova scotia" or province.lower() == "new brunswick": #15%    #Fixed: Valid Boolean comparisons
            #Order amount mult. by ON/NS/NB tax rate
            finalTotal = finalTotal * ON_NS_NB_TaxRate
            #print("Your final total is ${:.2f}".format(finalTotal))

        else:   #Any other prov/territory   11%                         #Note: This else fits the basic program description, but in practice, it may be 
                                                                        #better to have an elif line for EACH province/territory. Doing so would allow for 
                                                                        #future differences in provincial tax rates, as well as let us check that the user
                                                                        #actually entered a correct value for province. We could then use the else to deal
                                                                        #with invalid user entries. ie. if they enter a value that is NOT a valid province
            #Order amount mult. by other tax rate
            finalTotal = finalTotal * other_TaxRate
            #print("Your final total is ${:.2f}".format(finalTotal))

        print("Your final total is ${:.2f}".format(finalTotal))

    else:   #Any other country (no tax)                             #This else is used if the user enters any other value except Canada. In those cases, 
                                                                    #print the original amount, with no taxes.
        print("Your final total is ${:.2f}".format(orderAmount))

    #print("Your final total is ${:.2f}".format(finalTotal))        #We also discussed whether we even need an ELSE for country, since we always want to print a total.
                                                                    #If we use the same variable and have no custom messages from non-Canadians, this works too, if
                                                                    #we remove the country ELSE.

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()