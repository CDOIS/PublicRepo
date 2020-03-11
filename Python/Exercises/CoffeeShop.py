#A coffee shop programa
#The user will be prompted to enter how many cups they wish to order
# calculate total cost, based on the user-entered number of cups.

def main():
    #INPUT - ask user (#cups)
    print("Welcome to Ricardo's Coffee Shop!")
    print("This program will calculate and show you the total cost of your order")
    numberOfCups = input("Please input how many cups you want?")
    #PROCESS - price * num of cups
    coffeePrice = 1.25
    tax = 1.15
    totalwotax = coffeePrice * int(numberOfCups)
    taxtotal = (coffeePrice * tax) * int(numberOfCups)

    #OUTPUT - Message to user indicating total - numToRound, numOfDecimals
    roundedTotal = round(taxtotal, 2)
    
    print("Your total is: $" + str(roundedTotal))
main()