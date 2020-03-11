#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title:  
Description:    
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    #Create a party guest list.
    #User can add as many names & ages as they want
    #All will be saved in a CSV file at the end.
    #Declare my empty list
    guests = []
    name = ""
    
    print("Welcome to the Party Guest Program! \n")

    while name.lower() != "quit":
        name = input("Enter a guest`s name: ")
        if name.lower() == "quit":
            continue
        else:
            age = input("Enter the guest`s age: ")
            guests.append(name)
            guests.append(age)
    #At the end of the above loop, I have all data stored and saved
    #First, let's print the data on screen, formatted nicely
    #Second, write all the data from the lst, into the file

    for count in range(0, len(guests), 2):
        print(guests[count], guests[count+1])

    fileName = "GuestList.csv"
    accessMode = "w"
    myFile = open(fileName, accessMode)
    for count in range(0, len(guests), 2):
        myFile.write(guests[count] + "," + guests[count+1] + "\n")
    
    myFile.close()

    close



    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()