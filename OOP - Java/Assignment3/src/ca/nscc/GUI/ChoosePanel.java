package ca.nscc.GUI;

import ca.nscc.Classes.Barbarian;
import ca.nscc.Classes.Equipment;
import ca.nscc.Classes.Fighter;
import ca.nscc.Classes.Healer;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ChoosePanel extends JPanel {

    //Some controls need to be declared at the class level, if referenced in multiple places
    private JButton displayBtn;
    private JLabel imageLabel;
    private JTextField nameText;
    private JTextField hitpointText;
    private JTextField defenseText;
    private JTextField agilityText;
    private JTextField baseattackText;
    private JTextField classDescText;
    private JLabel equipImgLabel;
    private JTextField defenseModText;
    private JTextField baseAttackModText;

    private JRadioButton rdoFighter;
    private JRadioButton rdoBarbarian;
    private JRadioButton rdoHealer;

    private JRadioButton rdoGladio;
    private JRadioButton rdoAxe;
    private JRadioButton rdoStaff;

    private Fighter fighter = null;
    private Barbarian barbarian = null;
    private Healer healer = null;

    private Equipment equipment = null;


    public ChoosePanel() {

        //Set font object
        Font myFont = new Font("Calibri", Font.BOLD, 14);

        //Set Panel Properties
        setLayout(null);
        setVisible(true);

        //Create all GUI objects

        //Radiobutton for Classes
        addClassRadios(myFont);
        // Radiobuttons for Equipments
        addEquipRadios(myFont);

        //Label control for name
        JLabel screenTitle = new JLabel("Character Creation");
        screenTitle.setFont(myFont);
        screenTitle.setBounds(100,10, 500, 50);

        JLabel nameLabel = new JLabel("Name your adventurer:");
        nameLabel.setFont(myFont);
        nameLabel.setBounds(50, 60, 200, 50);

        //Textfield control for name
        nameText = new JTextField();
        nameText.setFont(myFont);
        nameText.setBounds(260, 60, 200, 50);

        classDescText = new JTextField();
        classDescText.setFont(myFont);
        classDescText.setBounds(50, 460, 500, 50);

        //Label for images
        imageLabel = new JLabel();
        imageLabel.setBounds(500, 10, 150, 150);

        equipImgLabel = new JLabel();
        equipImgLabel.setBounds(210,310,150,150);

        //Textfield to display attributes
        JLabel attLabel = new JLabel("Attributes:");
        attLabel.setFont(myFont);
        attLabel.setBounds(500, 160, 200, 50);

        hitpointText = new JTextField();
        hitpointText.setFont(myFont);
        hitpointText.setBounds(500, 210, 50, 50);
        defenseText = new JTextField();
        defenseText.setFont(myFont);
        defenseText.setBounds(500, 260, 50, 50);
        agilityText = new JTextField();
        agilityText.setFont(myFont);
        agilityText.setBounds(500, 310, 50, 50);
        baseattackText = new JTextField();
        baseattackText.setFont(myFont);
        baseattackText.setBounds(500, 360, 50, 50);
        defenseModText = new JTextField();
        defenseModText.setFont(myFont);
        defenseModText.setBounds(360, 310, 50, 50);
        baseAttackModText = new JTextField();
        baseAttackModText.setFont(myFont);
        baseAttackModText.setBounds(360, 360, 50, 50);

        //Change screen button
        displayBtn = new JButton("To Battle!");
        displayBtn.setFont(myFont);
        displayBtn.setBounds(500, 410, 200, 50);

        //Add all controls to Panel
        add(rdoFighter);
        add(rdoBarbarian);
        add(rdoHealer);
        add(rdoGladio);
        add(rdoAxe);
        add(rdoStaff);
        add(nameLabel);
        add(nameText);
        add(imageLabel);
        add(hitpointText);
        add(defenseText);
        add(agilityText);
        add(baseattackText);
        add(displayBtn);
        add(screenTitle);
        add(attLabel);
        add(classDescText);
        add(equipImgLabel);
        add(defenseModText);
        add(baseAttackModText);
    }
    //Methods - Radio buttons - Equipment
    private void addEquipRadios(Font myFont) {
        rdoGladio = new JRadioButton("Gladio");
        rdoGladio.setFont(myFont);
        rdoGladio.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent arg0) {
                    equipment = MainFrame.getGladio();
                    defenseModText.setText(String.valueOf(equipment.getDefenseMod()));
                    baseAttackModText.setText(String.valueOf(equipment.getBaseAttackMod()));
                    swapEquipImg(equipment.getIcon());
                    createChar();
                }
            });
        rdoAxe = new JRadioButton("Axe");
        rdoAxe.setFont(myFont);
        rdoAxe.addActionListener(new ActionListener() {
                public void actionPerformed (ActionEvent arg0){
                    equipment = MainFrame.getAxe();
                    defenseModText.setText(String.valueOf(equipment.getDefenseMod()));
                    baseAttackModText.setText(String.valueOf(equipment.getBaseAttackMod()));
                    swapEquipImg(equipment.getIcon());
                    createChar();
                }
            });

        rdoStaff = new JRadioButton("Staff");
        rdoStaff.setFont(myFont);
        rdoStaff.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
                equipment = MainFrame.getStaff();
                defenseModText.setText(String.valueOf(equipment.getDefenseMod()));
                baseAttackModText.setText(String.valueOf(equipment.getBaseAttackMod()));
                swapEquipImg(equipment.getIcon());
                createChar();
            }
        });

        JLabel nameLabel = new JLabel("Pick your Equipment:");
        nameLabel.setFont(myFont);
        nameLabel.setBounds(50, 260, 300, 50);
        add(nameLabel);

        rdoGladio.setBounds(50, 310, 150, 50);
        rdoAxe.setBounds(50, 360, 150, 50);
        rdoStaff.setBounds(50, 410, 150, 50);

        //ButtonGroup to group the radio buttons
        ButtonGroup grpColorRadios = new ButtonGroup();
        grpColorRadios.add(rdoGladio);
        grpColorRadios.add(rdoAxe);
        grpColorRadios.add(rdoStaff);
    }
    //Methods - Radio buttons - Classes
    private void addClassRadios(Font myFont) {
        rdoFighter = new JRadioButton("Fighter");
        rdoFighter.setFont(myFont);
        rdoFighter.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
                fighter = MainFrame.getTheFighter();
                hitpointText.setText(String.valueOf(fighter.getHitPoint()));
                agilityText.setText(String.valueOf(fighter.getAgility()));
                defenseText.setText(String.valueOf(fighter.getDefense()));
                baseattackText.setText(String.valueOf(fighter.getBaseAttack()));
                classDescText.setText(fighter.getFighterDesc());
                swapImages(fighter.getFighterIcon());
                //createChar();
            }
        });

        rdoBarbarian = new JRadioButton("Barbarian");
        rdoBarbarian.setFont(myFont);
        rdoBarbarian.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
                barbarian = MainFrame.getTheBarb();
                hitpointText.setText(String.valueOf(barbarian.getHitPoint()));
                agilityText.setText(String.valueOf(barbarian.getAgility()));
                defenseText.setText(String.valueOf(barbarian.getDefense()));
                baseattackText.setText(String.valueOf(barbarian.getBaseAttack()));
                classDescText.setText(barbarian.getBarbarianDesc());
                swapImages(barbarian.getBarbarianIcon());
                //createChar();
            }
        });

        rdoHealer = new JRadioButton("Healer");
        rdoHealer.setFont(myFont);
        rdoHealer.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
                healer = MainFrame.getTheHealer();
                hitpointText.setText(String.valueOf(healer.getHitPoint()));
                agilityText.setText(String.valueOf(healer.getAgility()));
                defenseText.setText(String.valueOf(healer.getDefense()));
                baseattackText.setText(String.valueOf(healer.getBaseAttack()));
                classDescText.setText(healer.getHealerDesc());
                swapImages(healer.getHealerIcon());
                //createChar();
            }
        });

        rdoFighter.setBounds(50, 110, 150, 50);
        rdoBarbarian.setBounds(50, 160, 150, 50);
        rdoHealer.setBounds(50, 210, 150, 50);

        //ButtonGroup to group the radio buttons
        ButtonGroup grpClassRadios = new ButtonGroup();
        grpClassRadios.add(rdoFighter);
        grpClassRadios.add(rdoBarbarian);
        grpClassRadios.add(rdoHealer);
    }
    //Method - Create player and set selected equipment;
    public void createChar() {
        String name = nameText.getText();
        if (rdoFighter.isSelected()) {
            fighter = MainFrame.getTheFighter();
            fighter.setName(name);
            if (rdoGladio.isSelected()) {
            fighter.setEquipname("Gladio");
            }
            else if (rdoAxe.isSelected()) {
            fighter.setEquipname("Axe");
            }
            else if (rdoStaff.isSelected()) {
            fighter.setEquipname("Staff");
            }
        }
        else if (rdoBarbarian.isSelected()) {
            barbarian = MainFrame.getTheBarb();
            barbarian.setName(name);
            if (rdoGladio.isSelected()) {
                barbarian.setEquipname("Gladio");
            }
            else if (rdoAxe.isSelected()) {
                barbarian.setEquipname("Axe");
            }
            else if (rdoStaff.isSelected()) {
                barbarian.setEquipname("Staff");
            }
        }
        else if (rdoHealer.isSelected()) {
            healer = MainFrame.getTheHealer();
            healer.setName(name);
            if (rdoGladio.isSelected()) {
                healer.setEquipname("Gladio");
            }
            else if (rdoAxe.isSelected()) {
                healer.setEquipname("Axe");
            }
            else if (rdoStaff.isSelected()) {
                healer.setEquipname("Staff");
            }
        }

    }
    //Methods - Select Images;
    public void swapEquipImg(ImageIcon equipImg){
        equipImgLabel.setIcon(equipImg);
    }
    public void swapImages(ImageIcon image) {
        imageLabel.setIcon(image);
    }
    //Method - Change Screen;
    public JButton getDisplayBtn() {
        return displayBtn;
    }


}
