#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title: Online Store in Canada!
Description: Program calculate the total charge for an order fom an online store in Canada
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    #Think process/Initialize variables; - Gather the user information;
    #Get total order $. Verify if the user lives on Canada, if not, dont charge any taxes;
    #If the user lives on CA, ask wich province; Verify the province and apply respective tax;
    userOrder: 0.0
    userCountry: " "
    userProvince: " "
    varCA = "Canada"
    varNB = "New Brunswick"
    varNS = "Nova Scotia"
    varON = "Ontario"
    varAB = "Alberta"
    taxAB = 1.05
    taxHzd = 1.15
    taxStd = 1.11
    totalOrder = 0.0
    def calcTotalOrderWithTaxes(userOrder, taxVar):
        totalOrder = userOrder * taxVar
        return totalOrder

    #START/INPUT - CHECK AND FUNCTION CALL
    print("Welcome to the Online Calculator!\nLet me tell you the total value for your order!")
    userOrder = float(input("Please enter the value of your order:"))
    userCountry = input("Please enter the Country you live in:")
    if userCountry.capitalize() == varCA:
        userProvince = input("Please enter the name of the Province you live in:")
        if userProvince.title() == varAB:
            totalOrder = calcTotalOrderWithTaxes(userOrder, taxAB)
        elif userProvince.title() == varON or userProvince.title() == varNB or userProvince.title() == varNS:
            totalOrder = calcTotalOrderWithTaxes(userOrder, taxHzd)
        elif userProvince.title() != varAB or userProvince.title() != varON or userProvince.title() != varNB or userProvince.title() != varNS:
            totalOrder = calcTotalOrderWithTaxes(userOrder, taxStd)
        
    #OUTPUT!
    print("Hey the total of your order is {0:.2f}".format(totalOrder))
            
    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()