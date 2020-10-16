package ca.nscc;
import java.awt.*;

public class PastShape extends ShapeC {

    //Basic constructor
    public PastShape () {
    }

    //Implement the inherited drawVehicle method
    @Override
    // Drawing Method
    public void drawShape(Graphics g) {

        //Get the main color
        Color mainColor = this.getShapeColor();


        g.setColor(mainColor);
        g.fillRect(this.getxPosition(), this.getyPosition(), (this.getWidth()*2)
                , this.getHeight());

        //2nd Rectangle of the flag
        int secondRectX = this.getxPosition();
        int secondRectY = this.getyPosition();
        int secondRectWidht = (this.getWidth()/4);
        g.setColor(Color.RED);
        g.fillRect(secondRectX, secondRectY, secondRectWidht, this.getHeight());

        //Thrd Rectangle
        int thrdRectX = secondRectX + (this.getWidth()/2);

        //Draw second wheel
        g.fillRect(thrdRectX, secondRectY, secondRectWidht,
                this.getHeight());

    }

    //Move method - add the X and Y Speed to the position attribute;
    public void moveShape() {
        this.setxPosition(this.getxPosition() + this.getxSpeed());
        this.setyPosition(this.getyPosition() + this.getySpeed());
    }
}
