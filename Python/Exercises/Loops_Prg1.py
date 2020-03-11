#For loop - Basic syntax
# for myCounter in range(10):
#     # for secondCounter in range(5):
#     #     print("Inside Loop: ", secondCounter)
#     print("Outside loop: ", myCounter + 1)
#     myCounter = myCounter - 1

# print("Loop over!")

#While loop
# x = 1
# counter = 1
# while x < 10:   #<-- Boolean condition
#     print("We're in loop #", counter)
#     counter = counter + 1
#     x = x + 1

# print("Loop over!")


invalidChoice = True

while invalidChoice == True:
    userValue = input("Enter an alphabet letter: ").upper()
    print(len(userValue))
    if userValue.isalpha() == True:
        print("Good job! You can read and enter a proper value!")
        invalidChoice = False
    else:
        print("You entered an incorrect choice, try again.")

print("End of program")