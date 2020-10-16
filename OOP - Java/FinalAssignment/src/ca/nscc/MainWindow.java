package ca.nscc;

import javax.swing.*;
import java.awt.*;

public class MainWindow extends JFrame {
    //Constructor
    public MainWindow() {
        //Configure the window's properties
        this.setBounds(100, 100, 800, 400);
        this.setResizable(false);
        this.setTitle("ScreenSaver");

        //Tell the 'X' button to actually close the window when clicked
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        Backpanel panel = new Backpanel();
        panel.setBackground(Color.WHITE);
        this.add(panel);
    }
}
