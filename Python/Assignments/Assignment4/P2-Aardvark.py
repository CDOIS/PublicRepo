#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title:  
Description:    
"""
#Function to write lists from DATA file
def listWrite(p_openFile):
    listS = []
    
    next_line = p_openFile.readline().strip("\n") #List output loop
    
    while next_line != "":
        listS.append(next_line)
        next_line = p_openFile.readline().strip("\n")
    
    return listS

#Function to write lists from CSVData File
def csvlistWrite(p_openCsv):
    import csv
    csvList = []
    csvData = csv.reader(p_openCsv)
    for r in csvData:
        csvList.append(r)

    return csvList   

#Open file function
def openFunction(p_Fname, p_aMode):
    my2dfileList = []
    
    try:#File error checking        
        if "csv" in p_Fname:
            openFile = open(p_Fname, p_aMode)            
            my2dfileList = csvlistWrite(openFile)
            openFile.close()
        else:
            openFile = open(p_Fname, p_aMode)            
            my2dfileList = listWrite(openFile)
            openFile.close()
    except OSError: #Error message
        print("There's currently an error, try again later.")
    
    #Return the desired list    
    return my2dfileList
    
#USER INPUT FUNCTION
def userPrompt(p_choicesList):
    choiceCount = 1    
    #Print the user choices
    print(f"Please choose {p_choicesList[0]}")
    for i in range(1, len(p_choicesList)):#Loop through all the available choices
        print(f"{choiceCount}) " + p_choicesList[i])
        choiceCount += 1
    while (True): #ERROR CHECKING - VALUE/DATATYPE
        try:
            while (True):
                usrCh = int((input("Enter choice (1-5): ")))
                if usrCh > 0 and usrCh < 6:
                    usrCh = p_choicesList[int(usrCh)]
                    str(usrCh)
                    break                
            break               
        except ValueError:
            print("Invalid value")        

    return usrCh

#Redact text function
def storyFill(p_textList, p_userChoices):
    changes = []
    changeline = p_textList[0]#primary line
    #Loop that goes through the lines of the text
    for i in range(0, len(p_textList)):
        changeline = p_textList[i]
        changeline = changeline.replace("_", "")
        #Loop that goes through all the letters of the sentence and do the replacing
        for b in changeline:
            if b.isnumeric():
                indB = (int(b) - 1)                
                changeline = changeline.replace(b, p_userChoices[indB].upper())
        changes.append(changeline)

    return changes

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!

    textFile = "the_story_file.txt"     #Original File 
    choicesFile = "the_choices_file.csv"    #Altered File
    aMode = "r"                         #Std AccessMode
    textList = [] #Original text
    choices2DList = [] #Original choices from CSV
    userChoices = [] 
    changedList = [] #Redacted text

    #Program start
    print ("Welcome to the Itsy Bitsy Aardvark")

    #Processing and user input
    textList = openFunction(textFile, aMode)
    choices2DList = openFunction(choicesFile, aMode)
    for i in range(0, len(choices2DList)):
        userChoices.append (userPrompt(choices2DList[i]))
    
    #Redacting function
    changedList = storyFill(textList, userChoices)
    
    #Output printing - program end
    for b in range(len(changedList)):
        print(changedList[b])
            
    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()