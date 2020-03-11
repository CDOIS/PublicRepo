#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title: Erenwhon Mobile Data Plan! 
Description: Program that process customer`s data usage and show the corresponding 
            rate and charge
"""
#WageCalc - Use the function to check the price range, calculates the wage and delives the final value
def WageCalc(p_userData):
    frstRange = 200
    scndRange = 500
    thrdRange = 1000
    flatRate200 = 20.0
    flatRate1gb = 118.0
    rate200to500 = 0.105
    rate500to1gb = 0.110
    if p_userData <= frstRange:
        totalCharge = flatRate200
    elif p_userData > frstRange and p_userData <= scndRange:
        totalCharge = p_userData * rate200to500
    elif p_userData > scndRange and p_userData <= thrdRange:
        totalCharge = p_userData * rate500to1gb
    elif p_userData > thrdRange:
        totalCharge = flatRate1gb
    return totalCharge
def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    #Program start, global variables(I/O) initiation, functions definitions;
    userData = 0.0
    totalCharge = 0.0        
    #Welcome/User input, ask user to input the data usage;
    print("Welcome to the Erewhon Mobile Data charge calculator!\n")
    userData = float(input("Please enter the data usage (Mb): "))
    #Process - function call;
    totalCharge = WageCalc(userData)    
    #Program End - User output - return the user the information;
    print("Total charge is: ${0:.2f}".format(totalCharge))
    #Your code ends on the line above
    
#Do not change any of the code below!
if __name__ == "__main__":
    main()