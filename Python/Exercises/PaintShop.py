Don't forget to rename this file after copying the template
for a new program!
"""
Student Name: Ricardo Oliveira
Program Title: Paint Shop 0.01g
Description: 
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!

    print("Welcome to THE paint shop paint program!")

    Roomheight = input("Please, type the height of your room:")
    Smallwidth = input("Please, type the width of the small wall:")
    Longwidth = input ("Please, type the width of the long wall:")
        
    Areawall = (float(Roomheight) * float(Smallwidth)) * 2 + (float(Roomheight) * float(Longwidth)) * 2
    
    Paintneed = Areawall/150
    
    print("You will need", int(Paintneed),"buckets of paint")
    print("Thank you for the preference!")

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()