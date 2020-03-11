#Define a list
#myList = ["A", "g", "T", "D", "H"]

# currIndex = myList.index("B")
# print(currIndex)
# myList.remove("A")
# currIndex = myList.index("B")
# print(currIndex)

#print(myList)

#JAVA
# int x = 5
# int[] myList;


# letter1 = input("Enter first letter:")
# letter2 = input("Enter second letter:")
# letter3 = input("Enter third letter:")

letters = []

orderWords = ["first", "second", "third"]

for count in range(10):
    letters.append(input("Enter {} letter: ".format(orderWords[count])))
    # letters.append(input("Enter second letter: "))
    # letters.append(input("Enter third letter: "))

print(letters)
