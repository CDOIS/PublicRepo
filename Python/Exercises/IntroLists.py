#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Ricardo Oliveira   
Program Title: Introduction to lists
Description:  
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    # myList = ["A", "B", "C", "D", "E"]
    # currIndex = myList.index("B")
    # print(currIndex)
    # myList.remove("A")
    # currIndex = myList.index("B")
    # print(currIndex)
    letters = []
    listrange = ["first", "second", "third"]
    for count in range(3):
        letters.append(input("Enter the letter {}:".format(listrange[count])))
    print(letters)



    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()