package ca.nscc;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.Random;

import javax.swing.*;

//Drawing Panel
public class Backpanel extends JPanel {

    //Declare a timer - to move the shapes
    private Timer timer = new Timer(10,  new TimerAction());

    //Array to store the shapes and colors
    private ArrayList<ShapeC> forms;
    Color[] colors = new Color[] {Color.BLACK, Color.RED, Color.BLUE,
            Color.GREEN, Color.MAGENTA, Color.YELLOW};

    // Panel Constructor
    public Backpanel() {

        //Start array
        forms = new ArrayList();

        //Creating forms and store them
        ShapeC form1 = new Circle();
        ShapeC form2 = new Circle();
        ShapeC form3 = new Square();
        ShapeC form4 = new Square();
        ShapeC form5 = new Triangle();
        ShapeC form6 = new PastShape();

        forms.add(form1);
        forms.add(form2);
        forms.add(form3);
        forms.add(form4);
        forms.add(form5);
        forms.add(form6);

        // Mouse Listener - on click - draw shapes and start/stop moving
        this.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                startOrStopMoving(e);
                for (ShapeC shp: forms){
                    createShape(shp);
                }
            }
        });
    }
    //Create Shape Method - setting all the values for each shape;
    private void createShape (ShapeC currShape) {
        Point p = MouseInfo.getPointerInfo().getLocation();

        int mousex = p.x;
        int mousey = p.y;

        Random rand = new Random();

        currShape.setShapeColor(colors[rand.nextInt(colors.length)]);
        currShape.setWidth((5+rand.nextInt(40)));
        currShape.setHeight(currShape.getWidth());
        currShape.setxPosition(rand.nextInt(mousex));
        currShape.setyPosition(rand.nextInt(mousey));

    }

    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g);	//Update the drawing board
        for (ShapeC shp: forms) {
            shp.drawShape(g);
        }
    }

    //Mouse event to start / stop the objects from moving
    private void startOrStopMoving(MouseEvent e) {

        if (timer.isRunning()) {
            timer.stop();
        } else {
            timer.start();
        }
    }

    public void moveEverything() {
        //Call the "move" method for each shape
        for (ShapeC shp: forms) {
            shp.moveShape();

            checkForWallHit(shp);
            checkUnitHits(shp);
        }

        this.repaint();
    }
    //Method to check if the shapes are colliding between themselves and
    // speed if collide
    public void checkUnitHits(ShapeC currShape) {

        for(ShapeC shp: forms) {

            Rectangle shpCheck = currShape.getBounds();
            Rectangle otherShpCheck = shp.getBounds();

            if(shp != currShape && shpCheck.intersects(otherShpCheck)){
                int tempXDirection = currShape.getxSpeed();
                int tempYDirection = currShape.getySpeed();

                currShape.setxSpeed(shp.getxSpeed()+1);
                currShape.setySpeed(shp.getySpeed()+1);

                shp.setxSpeed(tempXDirection+1);
                shp.setySpeed(tempYDirection+1);
            }
        }
    }
    //Method to check if the shapes are hitting te wall and change color
    public void checkForWallHit(ShapeC currShape) {
        Random rand = new Random();
        if ((currShape.getxPosition() + currShape.getWidth()) >= this.getWidth()) {

            currShape.setxSpeed(currShape.getxSpeed() * -1);
            currShape.setShapeColor(colors[rand.nextInt(colors.length)]);
        }
        else if (currShape.getxPosition() <= 0 ) {
            currShape.setxSpeed(currShape.getxSpeed() * -1);
            currShape.setShapeColor(colors[rand.nextInt(colors.length)]);

        }
        if ((currShape.getyPosition() + currShape.getHeight()) >= this.getHeight()) {
            currShape.setySpeed(currShape.getySpeed() * -1);
            currShape.setShapeColor(colors[rand.nextInt(colors.length)]);

        }
        else if (currShape.getyPosition() <= 0 ) {
            currShape.setySpeed(currShape.getySpeed() * -1);
            currShape.setShapeColor(colors[rand.nextInt(colors.length)]);
        }
    }

    private class TimerAction implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            //Whenever the timer fires a tick event, this method is called, which in turn calls our "drive" method.
            moveEverything();
        }
    }
}
