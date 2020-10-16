package ca.nscc;

import java.awt.*;

public class Circle extends ShapeC {

    //Basic constructor
    public Circle(){

    }


    @Override
    // Drawing Method
    public void drawShape(Graphics g) {
        g.setColor(this.getShapeColor());
        g.fillOval(this.getxPosition(), this.getyPosition(), this.getWidth(),
                this.getWidth());
    }
    //Move method - add the X and Y Speed to the position attribute;
    public void moveShape() {
        this.setxPosition(this.getxPosition() + this.getxSpeed());
        this.setyPosition(this.getyPosition() + this.getySpeed());
    }
}