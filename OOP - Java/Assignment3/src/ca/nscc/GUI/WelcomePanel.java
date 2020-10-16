package ca.nscc.GUI;


import javax.swing.*;
import java.awt.*;


public class WelcomePanel extends JPanel {

    private static JButton displayBtn;
    private ImageIcon welcomeIcon;
    private JLabel imageLabel;

    public WelcomePanel() {
        welcomeIcon = new ImageIcon(this.getClass().getResource(
                "/Images/welcome.jpg"));
        //Set font object
        Font myFont = new Font("Calibri", Font.BOLD, 24);

        //Set Panel Properties
        setLayout(null);
        setVisible(true);
        setBackground(Color.cyan);

        //Create all GUI objects


        //Label control for name
        JLabel nameLabel = new JLabel("Welcome to D $ D Game");
            nameLabel.setFont(myFont);
            nameLabel.setBounds(50, 10, 600, 50);


        //Label main image
        imageLabel = new JLabel();
            imageLabel.setBounds(50, 70, 512, 461);
            imageLabel.setIcon(welcomeIcon);

        //Change screen button
        displayBtn = new JButton("Character Creation");
            displayBtn.setFont(myFont);
            displayBtn.setBounds(50, 550, 500, 50);

        add(nameLabel);
        add(imageLabel);
        add(displayBtn);
    }

    public static JButton getDisplayBtn() {
        return displayBtn;
    }
}
