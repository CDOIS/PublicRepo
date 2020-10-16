package ca.nscc;

import java.awt.*;

public class Square extends ShapeC {

    //Basic constructor
    public Square(){

    }

    // Drawing Method
    @Override
    public void drawShape(Graphics g) {
        g.setColor(this.getShapeColor());
        g.fillRect(this.getxPosition(), this.getyPosition(), this.getWidth(),
                this.getHeight());
    }
    //Move method - add the X and Y Speed to the position attribute;
    public void moveShape() {
        this.setxPosition(this.getxPosition() + this.getxSpeed());
        this.setyPosition(this.getyPosition() + this.getySpeed());
    }
}
