package ca.nscc.GUI;

import ca.nscc.Classes.Monster;
import ca.nscc.Classes.Equipment;
import ca.nscc.Classes.Fighter;
import ca.nscc.Classes.Barbarian;
import ca.nscc.Classes.Healer;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


public class MainFrame extends JFrame {

    private static Fighter theFighter;
    private static Barbarian theBarb;
    private static Healer theHeal;
    private static Monster theMonster;
    private static Equipment Gladio;
    private static Equipment Axe;
    private static Equipment Staff;

    public MainFrame() {    //Constructor

        // Create Equipments
        Gladio = new Equipment("Gladio", 10,15);
        Axe = new Equipment("Axe", 0, 20);
        Staff = new Equipment("Staff", 15,0);

        //Create Classes
        theBarb = new Barbarian(120, 10, 20,
                30);
        theFighter = new Fighter(100, 80, 17,
                28);
        theHeal = new Healer(70, 99, 1,
                17);
        theMonster = new Monster(100, 10, 10,
                99,"Beholder");

        //Set Frame Properties
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setBounds(200, 200, 750, 750);
        setTitle("Dungeons $ Dragons Game");
        setLayout(new CardLayout());

        //Add Panel "screens"
        WelcomePanel welcomePanel = new WelcomePanel();
        ChoosePanel chooseScreen = new ChoosePanel();
        DisplayPanel displayScreen = new DisplayPanel();
        add(welcomePanel);
        add(chooseScreen);
        add(displayScreen);

        //Set Buttons
        JButton displayBtn = WelcomePanel.getDisplayBtn();
        displayBtn.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
                welcomePanel.setVisible(false);
                chooseScreen.setVisible(true);
                chooseScreen.createChar();
                displayScreen.displayChoice();
                displayScreen.setVisible(false);
            }
        });

        JButton displayBtn1 = chooseScreen.getDisplayBtn();
        displayBtn1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
                welcomePanel.setVisible(false);
                chooseScreen.setVisible(false);
                chooseScreen.createChar();
                displayScreen.displayChoice();
                displayScreen.setVisible(true);
            }
        });
    }

    public static Monster getTheMonster() {
        return theMonster;
    }
    public static Fighter getTheFighter() {
        return theFighter;
    }
    public static Healer getTheHealer() {
        return theHeal;
    }
    public static Barbarian getTheBarb() {
        return theBarb;
    }
    public static Equipment getGladio() {
        return Gladio;
    }
    public static Equipment getAxe() {
        return Axe;
    }
    public static Equipment getStaff() {
        return Staff;
    }
}
