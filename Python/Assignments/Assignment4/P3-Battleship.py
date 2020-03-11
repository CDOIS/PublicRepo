#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title:  BattleShip
Description: Battleship Game Program!
"""
#Retrieve map from the provided file;
#Create at least two lists with the p_board
#2d list and a string list, make specific
#Loops to check and display the map/hits
#User input inside the loop and check the lists
#if it hits and displays in the map and keep goin
#after it mets the criteria, end the program

#Function to write lists from DATA file
def listWrite(p_openFile):
    listS = []
    
    next_line = p_openFile.readline().strip("\n").split(",") #List output loop
    
    for i in range(10):
        listS.append(next_line)
        next_line = p_openFile.readline().strip("\n").split(",")
    
    return listS

#Open File function
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

#Function to print the board, each time it`s required
def printBoard(p_board, p_headRow, p_listMap):
    print(" ".join(p_headRow))
    
    for i in range(10):
        if i != 9:
            print(str(i+1) + " ", end=" ")
        else:
            print(str(i+1) + "", end=" ")

        for j in range(10):
            if p_board[i][j] == -1:
                print(" ", end="")

            if p_board[i][j] == "0" or p_board[i][j] == "1":
                print(p_board[i][j], end=" ")

            else:
                print(" ", end="")

            if (j+1) == 10:
                print("!")
        
        
        if (i+1) == 10:
            print("----------------------")
        else:
            print

def userInput(p_headRow):

    while (True):
        # while True:                                  
        usrTry = input("Choose your target(Ex. A1): ").upper
            # if usrTry[0].isalpha() and usrTry[1].isnumeric():
            #     if usrTry[0] > "J" or int(usrTry[1]) <= 0 and int(usrTry[1]) > 10:
            #         print("Invalid entry, please refer to the board to correct values")
            #         continue
            #     else:
            #         break                
            # else:            
            #     print("Invalid entry, please refer to the board to correct values")
            #     continue          
                   

        coords = []  
        coords.append(usrTry[0].upper())
        coords.append(int(usrTry[1:3]))
        
        coordX = 0
        

        for i in range(1, 10):                
            if coords[0].upper() == p_headRow[i]:
                coordX = i
        
        coordY = coords[1]-1
        coordX = int(coordX)-1
        
        return coordX, coordY


#Function to check if the missile hits
def hitCheck(p_listMaps, p_x, p_y, p_board):
    
    if p_listMaps[p_x][p_y] == "0":
        return "miss"
    elif p_board[p_x][p_y] == "0" or p_board[p_x][p_y] == "1":
        return "try again"
    else:
        return "hit"

def userHit(p_board, p_headRow, p_listMaps):
    #get coordinates from the user and try to make move
	#if move is a hit, check ship sunk and win condition
    while True:
        
        x, y = userInput(p_headRow)
        result = hitCheck(p_listMaps, y, x, p_board)

        if result == "hit":
            print(f"Hit at {p_headRow[x+1]}, {(y+1)}.")            
            
            p_board[y][x] = "1"

            if check_win(p_board):
                return "WIN"

            return p_board

        elif result == "miss":            
            print("Sorry, {0}, {1} is a miss.".format(p_headRow[x+1], (y+1)))

            p_board[y][x] = "0"

            return p_board
        
        elif result == "try again":
            print("Sorry, that coordinate was already hit.")


#Function to check if the game ended already
def check_win(p_board):
	
	#simple for loop to check all cells in 2d board
	#if any cell contains a char that is not a hit or a miss return false
	for i in range(10):
		for j in range(10):
			if p_board[i][j] != "0" and p_board[i][j] != '1':
				return False
	return True

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    
    textFile = "map.txt" #ProvidedMAP
    aMode = "r"          #Std AccessMode
    listMap = openFunction(textFile, aMode) #list containing provided map
    #Hidden board construction
    invisibleBoard = []
    for i in range(10):
        invisibleRow = []
        for j in range(10):
            invisibleRow.append(-1)
        invisibleBoard.append(invisibleRow)
    #Row containing the column headers
    headRow = ["  ","A","B","C","D","E","F","G","H","I","J"]


    varMissiles = 30
    

    print(f"Welcome to BattleShip! You have {varMissiles} missiles to try destroying the ships!")
    
    while varMissiles > 0:
        printBoard(invisibleBoard, headRow, listMap)
        invisibleBoard = userHit(invisibleBoard, headRow, listMap)
        varMissiles -= 1
        print(f"You still have {varMissiles} missiles")
        

        if invisibleBoard == "WIN":
            print("End game! You win!")
            quit()
        if varMissiles == 0:
            print("Out of missiles. Game Over.")
            quit()


    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()