#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title:  The A-Team
Description:  Program to display a text from a file, apply some randomly changes
and display the changed text
"""
#Function to write lists from DATA file;
def listWrite(p_openFile):
    listS = []
    row = 10 # Number of rows in file

    next_line = p_openFile.readline().strip("\n") #List output loop
    for i in range(row):
        listS.append(next_line)
        next_line = p_openFile.readline().strip("\n")
    
    return listS

#Open file function
def openFunction(p_Fname, p_aMode):
    my2dfileList = []
    
    try:#File error checking
        
        openFile = open(p_Fname, p_aMode)
        
        my2dfileList = listWrite(openFile)

        openFile.close()

    except OSError: #Error message
        print("There's currently an error, try again later.")
    #Return the desired list
    return my2dfileList

#List redact function - to meet the assignment parameters
def redactList(p_origTxt, p_altFile):
    
    line_count = 1 #Counter variable for line numbering
    limitChar = 20 #Number of characters for phrase changes
    next_line = [] #List for redacting

    #Line numbering    
    for count in range(0, len(p_origTxt)):
        next_line.append(f"{line_count}: " + p_origTxt[count])        
        line_count += 1
    
    
    import random #Random number variable att
    rndmNmbr = random.randint(0, 9)

    #Acess file on Write mode, to write the redacted version    
    aMode = "w" 
    myFile = open(p_altFile, aMode)

    #List redact according to the assignment 
    for count in range(0, len(next_line)):
        #Line with 20 or less char
        if len(next_line[count]) <= limitChar:
            next_line[count] = next_line[count].upper()
        #Line longer than 20 char
        elif len(next_line[count]) > limitChar:
            next_line[count] = next_line[count].lower()
        #Random line omit
        if count == rndmNmbr:
            # print("") -First iteration - the program was printing from within the function
            myFile.write("\n")
        else:
            # print(next_line[count]) -First iteration - the program was printing from within the function
            myFile.write(next_line[count]+"\n")
    
    myFile.close()


def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    
    textFile = "ateam_Original.txt" #Original File 
    altFile = "ateam_Altered.txt"   #Altered File
    aMode = "r"                     #Std AccessMode
    origTxt = []                    #Original Text 
    redactTxt = []                  #Altered Text 
    
    origTxt = openFunction(textFile, aMode) #Fuction call - Original Text
    redactList (origTxt, altFile)           #Function call - Redact Text/Save file
    redactTxt = openFunction(altFile, aMode)#Function call - Reproduce Altered file
    
    print("---------------------------------------------")
    print("Original Text")
    print("---------------------------------------------")
    for r in origTxt: #User output
        print(r)

    print("\n---------------------------------------------")
    print("Altered Text")
    print("---------------------------------------------")
    for e in redactTxt: #User output
        print(e)
   
    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()