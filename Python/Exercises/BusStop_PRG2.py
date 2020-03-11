#How do I get the data into my program?
#File reading!

#How to read as a 2d list?
#Use the csv.reader()
def openCSVinto2dList(fileName):
    import csv

    #fileName = "bus_stops.csv"
    accessMode = "r"

    busFile = open(fileName, accessMode)

    busData = csv.reader(busFile)

    my2dBusList = []

    for row in busData:
        my2dBusList.append(row)
    
    busFile.close()

    return my2dBusList
    # for col in row:
    #     print(col)

# for row in my2dBusList:
#     if row[6].startswith("Basinview"):
#         print(row[6])

myData = openCSVinto2dList("bus_stops.csv")

#Northernmost bus stop in HRM?
latCoords = []
for row in myData:
    if row[1].upper() != "Y":
        latCoords.append(row[1])

print(max(latCoords))