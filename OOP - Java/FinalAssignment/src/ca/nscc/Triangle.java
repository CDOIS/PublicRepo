package ca.nscc;

import java.awt.*;

public class Triangle extends ShapeC {

    int npoints = 3;
    //Basic constructor
    public Triangle() {
    }


    @Override
    // Drawing Method
    public void drawShape(Graphics g) {
        g.setColor(this.getShapeColor());
        g.fillPolygon(new int[]{this.getxPosition(),
                        (this.getxPosition()+(getWidth()/2)),
                        this.getxPosition()+this.getWidth()},
                new int[] {(this.getyPosition()+this.getHeight()),
                        (this.getyPosition()),
                        (this.getyPosition()+this.getHeight())},
                npoints);
    }

    //Move method - add the X and Y Speed to the position attribute;
    public void moveShape() {

//        int uLeftXPos = sPolXArray[0];
//        int uLeftYPos = sPolyYArray[0];
//        for (int i = 0; i < sPolXArray.length; i++){
//            sPolXArray[i] += getxSpeed();
//            sPolyYArray[i] += getySpeed();
        this.setxPosition(this.getxPosition() + this.getxSpeed());
        this.setyPosition(this.getyPosition() + this.getySpeed());
        }



}
