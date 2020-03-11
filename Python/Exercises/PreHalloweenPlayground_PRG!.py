#Range Function.
# range(5)        #1, 2 or 3 parameters (options!)
# range(1, 7)     #returns a list of numbers
# range(3, 13, 3) #[0,1,2,3,4]
                #[1,2,3,4,5,6]
                #[3, 6, 9, 12]

#Data validation primer (Check for numeric input)
# while True:
#     userVal = input("Please enter a number: ")  #12.23

#     #If there's a period (ie decimal), do something about it!
#     newVal = userVal.replace(".", "")
#     #print(newVal)
#     #Take user's number and multiply it by 3
#     if newVal.isdecimal():
#         #We know they entered a number
#         print("You entered a decimal number!")
#         break
#         print("ooooooo")    #WILL NEVER BE RUN!
#     else:
#         print("That's not a number!")

# print("Loop is done")

#Something cool (and probably useful)
# students = ["Ashraf", "Aaron", "Ricardo"]
# print("Hippopotamus"[-1])
# x = "Platypus is a weird animal!"
# x = x.replace("a", "e")
# for letter in x:
#     # if letter == "a":
#     #     print("e")
#     # else:
#         print(letter)

#Example of parallel lists
#We make the index match related values between diff. lists
# firstNames = ["Kyle", "Alex", "Alison"]
# lastNames = ["McCullough", "MacLean", "Goodhew"]
# grades = [90, 91, 92]

# for count in range(3):
#     print(firstNames[count] + " " + lastNames[count] + ": ", grades[count])

#NESTED LOOPS
#Each interior loop executes to completion before its parent
#loop starts its next iteration
# for counter in range(5):
#     print(counter)
#     for otherCounter in range(3):
#         print(otherCounter)
#         for thirdCounter in range(3):
#             print(thirdCounter)

#Split & Join   .split()  join()
myString = "A,B,C"
myList = ["Q", "R", "S"]

print(myString.split(","))
print("A".join(myList))