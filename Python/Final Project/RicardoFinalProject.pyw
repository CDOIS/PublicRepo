import sys

from PyQt5.QtWidgets import QApplication, QMainWindow, QMessageBox
from PyQt5.QtGui import QPixmap

#Program PseudoCoding - Phases 1, 2 and 3
#Create global List to store the country data from the file;

#Create a slot to for the QAction Menu Load File button and connect to a function;

#Create the slot function for triggered Action Load File -> That function should
#call two other functions, one to clear the memory list and load the data from the
#file into the list, and a second one to enable the right frame, clear the List Widget
#and load the data from the first column of the list (Country Names) into the widget;

#Create a slot to listen for when the list widget row changes, and connect to a
#row change slot function to check the value from the row change, display the 
#simple, formatted, information on the screen and call the helper functions to process
#the data and display the  information - Helper function to display the country flag 
#by using countryName and getting the correct filepath/name; Helper function to 
#display the population on the LineEdit; Set the default values for the ComboBox and 
#the radioButton;

#Create 3 slots to the radio buttons - one to setChecked the Mile Button; one to 
#connect to a function that displays the population density in square Miles and a third one to
#display the pop density in square Km; The radio Slot Functions have a helper function that
#will process the data into the correct information, according to the user iteraction;

#Create slot to combobox - connect to a slot function that will check the current value
#of the comboBox, process and display the respective information according the user selection;

#Create slot to the update push button - connect to a function that calls a helper function
#that processes, doing the value checking, outputing to the user the respective 
# information window(pop-up), and turn on the QActionMenu Save to file button;

#Create slot to the QAction Menu Save to File - connect to a slot function, that calls a helper
#function that writes the list in memory to the file;

#Create a slot function to the QAction Menu Exit button - connect to a function that closes the
#application - Create a CloseEvent function that checks if the user have saved the updates made 
# to list in memory and, if any have been done, pop up to user, asking if wants to save 
# before closing the application;


#ADD IMPORT STATEMENT FOR YOUR GENERATED UI.PY FILE HERE
import Ui_CountriesOWG
#      ^^^^^^^^^^^ Change this!

#CHANGE THE SECOND PARAMETER (Ui_ChangeMe) TO MATCH YOUR GENERATED UI.PY FILE
class MyForm(QMainWindow, Ui_CountriesOWG.Ui_MainWindow):
#                         ^^^^^^^^^^^   Change this!
    #Declare global memory list
    #Declaring
    countryList = [] #Global Variable lists
    SaveValue = False

    # DO NOT MODIFY THIS CODE
    def __init__(self, parent=None):
        super(MyForm, self).__init__(parent)
        self.setupUi(self)
    # END DO NOT MODIFY

        # ADD SLOTS HERE, indented to this level (ie. inside def __init__)
        # self.actLoadFromFile.triggered.connect(self.LoadMenuTriggered)
        self.actionLoadCountries.triggered.connect(self.LoadMenuTriggered)       
        self.listWidgetShowCountry.currentRowChanged.connect(self.ListRowChanges)
        self.radioButtonPopPerSQMile.setChecked(True)
        self.radioButtonPopPerSQMile.clicked.connect(self.PopDensitySqMile)
        self.radioButtonPerSqKMPop.clicked.connect(self.PopDensitySqKM)        
        self.comboBoxSqMilesxSqKM.currentIndexChanged.connect(self.ComboBoxVal)
        self.pushButtonUpdatePop.clicked.connect(self.updatePop)
        self.actionSavetoFile.triggered.connect(self.SaveFile)
        self.actionExitButton.triggered.connect(self.exit_app)
        self.rightViewFrame.hide()
        

    # ADD SLOT FUNCTIONS HERE
    # These are the functions your slots will point to
    # Indent to this level (ie. inside the class, at same level as def __init__)
    #Load data and from memory to the list widget;
    def LoadMenuTriggered(self): 
        self.LoadDataFromFile()
        self.LoadfromMemtoListWidget()

    #According to user interaction - Display info and call functions to process data and display info
    def ListRowChanges(self, newIndex): 
        self.rightViewFrame.show()        
        CtryName = self.countryList[newIndex][0]
        self.labelCountryName.setText(CtryName)        
        CtryArea = float(self.countryList[newIndex][2])
        self.labelTotalAreaValue.setText(f"{CtryArea:,.1f}")
        self.countryFlag(CtryName,newIndex)
        self.countryPop(newIndex)   
        self.comboBoxSqMilesxSqKM.setCurrentIndex(0)
        self.radioButtonPopPerSQMile.setChecked(True)

    #According to user interaction - Process and display the correct information
    def ComboBoxVal(self):
        rowIndex = self.listWidgetShowCountry.currentRow()
        CtryArea = float(self.countryList[rowIndex][2])
        boxVal = self.comboBoxSqMilesxSqKM.currentText()
        if boxVal == "Sq.Miles":
            self.labelTotalAreaValue.setText(f"{CtryArea:,.1f}")
        else:
            KmArea = CtryArea * 2.59
            self.labelTotalAreaValue.setText(f"{KmArea:,.1f}")

    #RadioButton Interaction - Call helper function, sending a Mile Flag
    def PopDensitySqMile(self):
        sqMile = 1        
        self.ctryPopDens(sqMile)

    #RadioButton Interaction - Call helper function, sending a KM Flag
    def PopDensitySqKM(self):
        sqKm = 0        
        self.ctryPopDens(sqKm)

    #Update PushButton function - Call helper function, sending the desired update value
    def updatePop(self):        
        self.updatePopCheck()

    #Save QAction triggered function - Set saved global Flag and call helper function
    def SaveFile(self):
        self.SaveValue = True
        self.SaveToFileFunction()

    #Exit QAction triggered function - close application
    def exit_app(self):
        QApplication.closeAllWindows()         

#Example Slot Function
#   def SaveButton_Clicked(self):
#       Make a call to the Save() helper function here

    #ADD HELPER FUNCTIONS HERE
    # These are the functions the slot functions will call, to 
    # contain the custom code that you'll write to make your progam work.
    # Indent to this level (ie. inside the class, at same level as def __init__)

    #Load list from the memory to the Widget;
    def LoadfromMemtoListWidget(self): 
        self.listWidgetShowCountry.clear()        
        for row in self.countryList:
            name = row[0]
            self.listWidgetShowCountry.addItem(name)

    #Load the data from file;
    def LoadDataFromFile(self):
        self.countryList.clear()
        import csv
        fileName = "countries.txt"
        accessMode = "r"                
        myFile = open(fileName, accessMode)
        fileData = csv.reader(myFile)            
        for row in fileData:            
            self.countryList.append(row)    

    #Process the data to alter the label to the flag
    def countryFlag(self,CtryName,newIndex):
        CountryName = CtryName.replace(" ","_")
        CtryFlag = ("Flags\\{0}.png".format(CountryName))
        image = QPixmap(CtryFlag)
        self.labelFlagIMG.setPixmap(image) 

    #Process the data to display the percentage of world pop;
    def countryPop(self,newIndex):
        CtryPop = int(self.countryList[newIndex][1])        
        self.lineEditPopulationValue.setText(f"{CtryPop:,}")
        wrlPop = 0.0           
        for row in self.countryList:
            wrlPop += float(row[1])
        prcentWrldPop = (100/float(wrlPop)) * float(CtryPop)
        self.labelPercentWPValue.setText(f"{prcentWrldPop:.4f}%")
        CtryArea = self.countryList[newIndex][2]
        CtryPopDens = CtryPop / float(CtryArea)
        self.labelPopDensValue.setText(f"{CtryPopDens:.2f}")

    #Process the density, according to the parameter received, and display the correct info
    def ctryPopDens(self, KmorSq):
        rowIndex = self.listWidgetShowCountry.currentRow()
        Pop = self.countryList[rowIndex][1]
        CtryArea = self.countryList[rowIndex][2]
        if KmorSq == 1:                                   
            PopDensValue = float(Pop) / float(CtryArea)
            self.labelPopDensValue.setText(f"{PopDensValue:.2f}")
        else:            
            SqKm = (float(Pop) / float(CtryArea)) * 2.59
            self.labelPopDensValue.setText(f"{SqKm:.2f}")

    #Write to file function
    def SaveToFileFunction(self):        
        with open("countries.txt", "w") as File:
            for row in self.countryList:
                File.write(",".join(row)+"\n")

    #Process data about the update population value - error handling and replacing mem list;
    def updatePopCheck(self):
        
        rowIndex = self.listWidgetShowCountry.currentRow()
        memPop = self.countryList[rowIndex][1]
        updateData = "Data has been updated in memory, but hasn't been updated in file yet."
        invalidMsg = "Data is invalid so not updated in memory."
        try:
            updatePop = self.lineEditPopulationValue.text()
            popVal = updatePop.replace(",","")
            popVal = int(popVal)

        
        except ValueError:
            QMessageBox.information(self,"Invalid",
            invalidMsg, QMessageBox.Ok)
            self.lineEditPopulationValue.setText(f"{int(memPop):,}") 
             
        self.countryList[rowIndex][1] = str(popVal)
        QMessageBox.information(self, "Updated",
        updateData, QMessageBox.Ok)
        self.SaveValue = False
        self.actionSavetoFile.setEnabled(True)
        self.ListRowChanges(rowIndex)
        self.actionLoadCountries.setEnabled(False)
    #Function to the closeEvent - check the save flag and if the memory is not saved - offer
    #to the user the opportunity to save it.
    def closeEvent(self, event):
                
        if self.SaveValue == False:

            saveMsg = "Save changes to file before closing?"
            reply = QMessageBox.question(self, "Save?",
                    saveMsg, QMessageBox.Yes, QMessageBox.No)
            
            if reply == QMessageBox.Yes:
                self.SaveToFileFunction()
                event.accept()
            else:
                event.accept()
        
#Example Helper Function
#    def Save(self):
#       Implement the save functionality here

# DO NOT MODIFY THIS CODE
if __name__ == "__main__":
    app = QApplication(sys.argv)
    the_form = MyForm()
    the_form.show()
    sys.exit(app.exec_())
# END DO NOT MODIFY