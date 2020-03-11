#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name:    Geoff
Program Title:  Hockey  
Description:   It's hockey! 
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!

    #1. Variables
    teamName = ""
    numWins = 0
    numLosses = 0 
    totalGames = 0
    winPct = 0.0

    #2. Welcome
    print("Welcome to the GHL\n")
    
    #3. Ask user for team name 
    teamName = input("Please enter a team name: ")

    #4. Ask for # wins from user
    numWins = input("Please enter number of wins: ")

    #5. Ask for # losses from user
    numLosses = input("Please enter number of losses: ")

    #6. PROCESSING
    #   total games = wins + losses
    #   win pct = wins / total games
    totalGames = int(numWins) + int(numLosses)
    winPct = int(numWins) / totalGames

    #OUTPUT
    #7. Build and print display string
    #7A. Format win % to 4 decimals
    # print(teamName + " had " + numWins + " wins and " 
    #     + numLosses + " losses and a win percentage of " + str(round(winPct, 4)))

    outputString = "{0} had {1} wins and {2} losses and a win percentage of {3:.4f}".format(teamName, numWins, numLosses, winPct)
    print(outputString)

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()