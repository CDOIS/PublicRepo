"""
Student Name:  Geoff Gillespie  
Program Title:  Energy Calculator - BROKEN
Description:   Debugging practice
"""

def main(): #<-- Don't change this line!
    
    print("Energy Calculator")
    print("\nThis program will calculate how much you pay for electricity for")
    print("a particular device, based on the wattage of the device and how")
    print("many hours the device was in use.")
    print("\nCalculations are based on a cost of 12.65 cents per kiloWatt hour.")

    kwhPrice = 12.65 
    avgDaysInAMonth = 30.42
    monthsInYear = 12

    deviceWattage = float(input("\nEnter the wattage of the device: "))
    hoursUsedPerDay = float(input("Enter how many hours per day the device is in use: "))

    kwhPerDay = (deviceWattage / 1000) * hoursUsedPerDay #BUG, need to assign this value before calculations
    costPerHour = ((deviceWattage / 1000) * kwhPrice) / 100 #BUG, math bug ! need to put a 0 inside device wattage to (kWh)
    costPerDay = kwhPerDay * kwhPrice / 100 #BUG, math error 
    costPerMonth = avgDaysInAMonth * costPerDay #BUG, math error, removed the * 60
    costPerYear = monthsInYear * costPerMonth
    

    print("\nElectrical cost for a device using {0:.2f} watts for {1} hour per day:".format(deviceWattage, hoursUsedPerDay)) #BUG! the 2nd format insert point was wrong {0}
    print("\tCost Per Hour:\t${0:.1f}".format(costPerHour))
    print("\tCost Per Day:\t${0:.4f}".format(costPerDay))
    print("\tCost Per Month:\t${0:.5f}".format(costPerMonth))
    print("\tCost Per Year:\t${0:.2f}".format(costPerYear)) #BUG, wrong variable was inside the format
    print("\tkWh Per Day:\t{0:.2f}".format(kwhPerDay))

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()