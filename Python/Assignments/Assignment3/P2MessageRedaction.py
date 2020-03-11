#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title: Message Redaction
Description: Removes all desired letters from any user-entered sentence or phrase
"""
#Function to redact phrases
#1st parameter, the phrase itself, 2nd parameter, the redact letters
def redactOmatic(p_usrPhrs, p_usrList):
    usRedacted = p_usrPhrs
    
    for counter in p_usrList: #Redact the letters
        usRedacted = usRedacted.replace((counter.lower()), "_")
        usRedacted = usRedacted.replace((counter.upper()), "_")
    return usRedacted

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    
    #Program Start - declaring variables
    usrPhrs = "" #String - List of characters to be redacted
    usrList = "" #String - List of characters to redact
    usrRedact = 0 #Variable to hold the number of the replaced count
    usrCheck = "" #Variable to check data input
    usrCheck1 = "" #Variable to check data input
    usrch1 = True
    #Welcome message
    print("Welcome to the Message Redaction Program!")       
    while usrPhrs.lower() != "quit": #Program loop
        
        #User input - data check - quit program        
        while True:
            usrPhrs = input("Type a phrase (or quit to exit program): ")
            for a in usrPhrs: #Data input check
                if (a.isalpha()) == True:
                    usrCheck+= a
            if usrCheck.isalpha():
                break
            else:
                continue
    
            #Quit program button
        if usrPhrs.lower() == "quit": 
            print("Thank you for using the Redact-ME.") #Exit message
            continue
            
            #Second user input
        else:
            while usrch1 == True:
                usrList = input("Type a comma-separated list of letters to redact: ")
                for b in usrList: #Data input check
                    if (b.isalpha()) == True and usrList.count(",") >= 1:
                        usrCheck1+= b                    
                if usrCheck1.isalpha(): #Data input check
                    usrch1 = False
                else:
                    print("ERROR")                
                    continue

        #Due process - function call - redact counter
        usRedacted = redactOmatic(usrPhrs, usrList)           
        usrRedact = usRedacted.count("_")
        
        #User output - End of program
        print("Number of letters redacted: {}".format(usrRedact))
        print("Redacted phrase: {}".format(usRedacted))

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()