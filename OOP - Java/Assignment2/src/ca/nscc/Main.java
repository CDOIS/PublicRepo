package ca.nscc;

import javax.swing.*;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) {
        //VARIABLES
        Object[] Buttons = {"Student", "Staff", "Finish"};  //OBJECTS - OptionDialog
        ArrayList<Staff> staffList = new ArrayList<Staff>();
        ArrayList<Student> studentList = new ArrayList<Student>();
        String stuName = "";
        String stuAddress = "";
        int stuYears = 0;
        boolean stuYearChk = false;
        String staffName = "";
        String staffAddress = "";
        int staffYears = 0;
        int usrChoice = 0;
        String studentReport = "";
        String staffReport = "";
        double incomeReport = 0;
        double outcomeReport = 0;

        //PROGRAM START

        JOptionPane.showMessageDialog(null, "Welcome to the Educational Accounting Program",
                "Accounting App", JOptionPane.INFORMATION_MESSAGE);

        //While LOOP to keep program open and iterate through options
        while (usrChoice != 2) {

            usrChoice = JOptionPane.showOptionDialog(null,
                    "Select Student or Staff.",
                    "Accounting App",
                    JOptionPane.DEFAULT_OPTION,
                    JOptionPane.QUESTION_MESSAGE, null, Buttons, Buttons[0]);

            if (usrChoice == 0) { //STUDENT DATA INPUT
                stuName = nameInput("Student");
                stuAddress = addressInput("Student");
                //Input Validation - # of years between 1 and 4
                do {
                    stuYears = yearsInput("Student year(1-4)");
                    if (stuYears >= 1 && stuYears <= 4) {
                        stuYearChk = true;
                    } else {
                        JOptionPane.showMessageDialog(null, "Enter a valid number!",
                                "Accounting App", JOptionPane.WARNING_MESSAGE);
                    }
                } while (!stuYearChk);
                //Make student object and append to arrayList
                studentList.add(new Student(stuName,stuAddress, stuYears));
            }

            if (usrChoice == 1) { //STAFF DATA INPUT
                staffName = nameInput("Staff");
                staffAddress = addressInput("Staff");
                staffYears = yearsInput("Staff years of service");
                //Make staff object and append to arrayList
                staffList.add(new Staff(staffName, staffAddress, staffYears));
            }
        }
        //BUILD MONTHLY BALANCE REPORT
        for (Student currentStudent: studentList) { //LOOP TO ITERATE THROUGH STUDENT ARRAYLIST AND BUILD REPORT VAR;
            studentReport = studentReport + currentStudent.toString();
            incomeReport = incomeReport + currentStudent.getFee();

        }
        for (Staff currentStaff: staffList) { //LOOP TO ITERATE THROUGH STAFF ARRAYLIST AND BUILD REPORT VAR;
            staffReport = staffReport + currentStaff.toString();
            outcomeReport = outcomeReport + currentStaff.getSalary();
        }

        //REPORT PROCESSING - MATH;
        incomeReport = (incomeReport/2); // DIVIDED FEES
        outcomeReport = (outcomeReport/26); //BI-WEEK PAY
        //DECIMAL FORMATTING - INDIVIDUALLY;
        String decimalOutcome = String.format("%.2f",outcomeReport);
        String decimalIncome = String.format("%.2f", incomeReport);
        String decimalTotal = String.format("%.2f", (incomeReport-outcomeReport));

        JOptionPane.showMessageDialog(null, "Students=["+studentList.size()+"]\n" +
                        studentReport+"Staff=["+staffList.size()+"]\n"+ staffReport+"\n\nMonthly Balance:\n" +
                        "Outgoing: $"+decimalOutcome+".\n"+"Incoming: $"+decimalIncome+".\nTotal: $"+decimalTotal+".\n",
                        "R E P O R T - zo/", JOptionPane.INFORMATION_MESSAGE);
    }

    //    PUBLIC METHODS - GATHER USER INPUT & INITIAL VALIDATION;
    public static String nameInput(String Role) {
        String usrInput = JOptionPane.showInputDialog(null, "Enter " + Role + " name",
                "Accounting App", JOptionPane.QUESTION_MESSAGE);
        while (usrInput.equals("")) { //CHECK FOR EMPTY INPUT
            JOptionPane.showMessageDialog(null, "Cannot accept blank entries!",
                    "Accounting App", JOptionPane.WARNING_MESSAGE);
            usrInput = JOptionPane.showInputDialog(null, "Enter " + Role + " name",
                    "Accounting App", JOptionPane.QUESTION_MESSAGE);
        }
        return usrInput;
    }

    public static String addressInput(String Role) {
        String usrScndInput = JOptionPane.showInputDialog(null, "Enter " + Role + " Address",
                "Accounting App", JOptionPane.QUESTION_MESSAGE);
        while (usrScndInput.equals("")) { //CHECK FOR EMPTY INPUT
            JOptionPane.showMessageDialog(null, "Cannot accept blank entries!",
                    "Accounting App", JOptionPane.WARNING_MESSAGE);
            usrScndInput = JOptionPane.showInputDialog(null, "Enter " + Role + " Address",
                    "Accounting App", JOptionPane.QUESTION_MESSAGE);
        }
        return usrScndInput;
    }

    public static int yearsInput(String Specs) {
        String usrThrdInput = "";
        boolean intVal; //DATA VALIDATION FLAG - INTEGER INPUT;
        do {
            try {
                usrThrdInput = JOptionPane.showInputDialog(null, "Enter " + Specs,
                        "Accounting App", JOptionPane.QUESTION_MESSAGE);
                while (usrThrdInput.equals("")) { //CHECK FOR EMPTY INPUT
                    JOptionPane.showMessageDialog(null, "Cannot accept blank entries!",
                            "Accounting App", JOptionPane.WARNING_MESSAGE);
                    usrThrdInput = JOptionPane.showInputDialog(null, "Enter " + Specs,
                            "Accounting App", JOptionPane.QUESTION_MESSAGE);
                }

                int i = Integer.parseInt(usrThrdInput); //TRY CAST INPUT INTO INTEGER;

                if (i <= 0 && i >= 31) { //IF CAST OK - CHECK FOR MIN AND MAXIMUM VALUE INPUT;
                    JOptionPane.showMessageDialog(null, "Please enter a valid number!",
                            "Accounting App", JOptionPane.WARNING_MESSAGE);
                    intVal = false;
                } else {
                    intVal = true;
                }
            } catch (NumberFormatException e) { //IF ERROR WHEN CASTING - RETURN ERROR MESSAGE AND ASK INPUT AGAIN;
                JOptionPane.showMessageDialog(null, "Please enter a valid number!",
                        "Accounting App", JOptionPane.WARNING_MESSAGE);
                intVal = false;
            }
        }while (!intVal);
        return Integer.parseInt(usrThrdInput);
    }
}

