#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name:    
Program Title:  
Description:    
"""
def WritePairedListToFile(p_aList):
    #Write to File
    fileName = "GuestList.csv"
    accessMode = "w"

    #Open file connection
    myFile = open(fileName, accessMode)

    #Loop through guests (skipping by twos again) and print in csv format
    #one guest/age per line
    for count in range(0, len(p_aList), 2):
        myFile.write(p_aList[count] + "," + p_aList[count + 1] + "\n")

    #Close file
    myFile.close()

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!

    #Create a party guest list.
    #User can add as many names & ages as they want
    #All will be saved in a CSV file at the end.

    #Declare my empty list
    guests = [] 
    #Below is a temp list we used for testing/running our program during development
    #guests = ["Geoff", "45", "Billy", "12", "Violet", "3"]
    name = ""

    print("Welcome the the Party Guest Program!\n")

    #Loop to allow user to repeatedly enter new name/age pairs, until they type quit
    while name.lower() != "quit":
        name = input("Enter a guest's name: ")

        #IF statement to control when we exit the loop
        #Don't add "Quit" to the list
        #Also, don't ask for age after user enters quit
        if name.lower() == "quit":
            continue
        else:
            age = input("Enter the guest's age: ")
            #Add values to our list
            guests.append(name)
            guests.append(age)

    #At the end of the above loop, I have all data stored and saved in memory
    #First, let's print the data on screen, formatted nicely
    #Second, write all the data from the list, into the file

    #print(guests) Original, raw printing

    #Loop through the existing guest list and print to screen
    #Note: Skipping by twos, so we're always landing on the names, not ages
    for count in range(0, len(guests), 2):
        print(guests[count], guests[count + 1])

   #File Writing code used to be here, before we function-ed it
    WritePairedListToFile(guests)

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()