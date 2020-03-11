"""
Student Name: Ricardo Oliveira    
Program Title: Hipster local vynil records - customer order details
Description: This is a program that calculate the receipts with total cost of products
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    #Start point- initial considerations: the program take 3 inputs.
    #Calculates total delivery cost; includes tax; output to the user
    #The total delivery, the purchase with tax and the total cost.
    customerName = " "
    deliverDistanceKM = 0.0
    purchaseInput = 0.0
    fixedTax = 1.14
    deliverRate = 15
    taxPurchase = 0.0
    totalDeliver = 0.0
    
    #WELCOME/INPUT - Take the values from the user
    print("Welcome to Hipster's Local Vinyl Records - Customer Order Details\n")
    customerName = input("Enter customer's name: ")
    deliverDistanceKM = float(input("\nEnter the distance in kilometers for delivery: "))
    purchaseInput = float(input("\nEnter the cost of records purchased: "))
    #PROCESSING - Math!1!# 
    # totalDeliver = deliverRate * deliverDistanceKM
    # taxPurchase = purchaseInput + subjTax
    # totalCost = deliverRate + taxPurchase + taxPurchase
    taxPurchase = purchaseInput * fixedTax
    totalDeliver = deliverRate * deliverDistanceKM
    totalCost = taxPurchase + totalDeliver
    #OUTPUT - Results/Deliver to the user/ Ent point
    print("Purchase summary for " + customerName)
    print("Delivery Cost: ${0:0,.2f} \nPurchase Cost: ${1:0,.2f} \nTotal Cost: {2:0,.2f}".format(totalDeliver,taxPurchase, totalCost))

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()