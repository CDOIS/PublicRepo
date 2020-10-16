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
import java.util.ArrayList;

public class DisplayPanel extends JPanel {
    //Objects to display
    private Fighter Fighter;
    private Barbarian Barbarian;
    private Healer Healer;
    private JLabel imageLabel;
    private JLabel monsterImgLabel;
    private Monster theMonster;
    private Equipment Axe;
    private Equipment Gladio;
    private Equipment Staff;
    private JTextArea displayText;

    public DisplayPanel() { //Constructor

        //Set Panel Properties
        Font myFont = new Font("Calibri", Font.BOLD, 24);
        setLayout(null);

        //Label Properties;
        JLabel dText = new JLabel("Player vs Monster");
        dText.setFont(myFont);
        dText.setBounds(50, 10, 250, 50);

        JLabel vsText = new JLabel("VS");
        vsText.setFont(myFont);
        vsText.setBounds(250, 450, 50, 50);

        displayText = new JTextArea();
        displayText.setBounds(50, 50, 500, 400);
        displayText.setFont(myFont);
        displayText.setLineWrap(true);
        displayText.setEnabled(false);
        displayText.setWrapStyleWord(true);

        imageLabel = new JLabel();
        imageLabel.setBounds(50, 450, 150, 150);
        monsterImgLabel = new JLabel();
        monsterImgLabel.setBounds(300, 450, 150, 150);

        //Add objects to Panel;
        add(dText);
        add(vsText);
        add(displayText);
        add(monsterImgLabel);
        add(imageLabel);
    }

    public void displayChoice() { //Method to display the selection;
        Fighter = MainFrame.getTheFighter();
        Barbarian = MainFrame.getTheBarb();
        Healer = MainFrame.getTheHealer();
        theMonster = MainFrame.getTheMonster();
        Axe = MainFrame.getAxe();
        Gladio = MainFrame.getGladio();
        Staff = MainFrame.getGladio();
        monsterImgLabel.setIcon(theMonster.getMonsterPic());
        String text = "";

        if (Fighter.getName() != null && Fighter.getName() != "") {
            imageLabel.setIcon(Fighter.getFighterIcon());
            if (Fighter.getEquipname().equals("Axe")) {
                text =
                        Fighter.toString() + "\nEquiped= " + Axe.toString() + theMonster.toString();
            } else if (Fighter.getEquipname().equals("Gladio")) {
                text =
                        Fighter.toString() + "\nEquiped= " + Gladio.toString() + theMonster.toString();
            } else if (Fighter.getEquipname().equals("Staff")) {
                text =
                        Fighter.toString() + "\nEquiped= " + Staff.toString() + theMonster.toString();
            }
        }
        else if (Barbarian.getName() != null && Barbarian.getName() != "") {
            imageLabel.setIcon(Barbarian.getBarbarianIcon());
            if (Barbarian.getEquipname().equals("Axe")) {
                text =
                        Barbarian.toString() + "\nEquiped= " + Axe.toString() + theMonster.toString();
            } else if (Barbarian.getEquipname().equals("Gladio")) {
                text =
                        Barbarian.toString() + "\nEquiped= " + Gladio.toString() + theMonster.toString();
            } else if (Barbarian.getEquipname().equals("Staff")) {
                text =
                        Barbarian.toString() + "\nEquiped= " + Staff.toString() + theMonster.toString();
            }
        }
        else if (Healer.getName() != null && Healer.getName() != "") {
            imageLabel.setIcon(Healer.getHealerIcon());
            if (Healer.getEquipname().equals("Axe")) {
                text =
                        Healer.toString() + "\nEquiped= " + Axe.toString() + theMonster.toString();
            } else if (Healer.getEquipname().equals("Gladio")) {
                text =
                        Healer.toString() + "\nEquiped= " + Gladio.toString() + theMonster.toString();
            } else if (Healer.getEquipname().equals("Staff")) {
                text =
                        Healer.toString() + "\nEquiped= " + Staff.toString() + theMonster.toString();
            }
        }
        displayText.setText(text);
    }
}
