#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name:    
Program Title:  
Description:    
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!

    finalTotal = 0
    shippingCost = 10
    freeShippingThreshold = 49.99
    finalMsg = "Your final total is ${:.2f}"

    print("Shipping Charges Program")

    cost = float(input("Enter the amount of your purchase: $"))

    if cost >= freeShippingThreshold:
        #They got free shipping
        finalTotal = cost
        print("You got free shipping!")
    else:
        finalTotal = cost + shippingCost

    print(finalMsg.format(finalTotal))

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()