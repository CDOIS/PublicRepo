#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira
Program Title: Hockey Team!
Description: A program to calculate the win ratio of a hockey team
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    print("This program will the Hockey Team win-loss percentage")
    userName = input("Welcome to the rating app, what should i call you?")
    hockeyTeam = input(userName + ", please type the name of your Hockey Team:")
    Teamwin = input("How many wins:")
    Teamloss = input("How many losses:")
    totalGames = (int(Teamloss) + int(Teamwin))
    winRate = (int(Teamwin) / int(totalGames))
    print("Hey {0}, the {1} have won {2} games and lost {3} with an win rate of {4:0,.4f}.".format(userName, hockeyTeam, Teamwin, Teamloss, winRate))
    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()