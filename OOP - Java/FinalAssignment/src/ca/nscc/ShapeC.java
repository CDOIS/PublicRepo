package ca.nscc;

import java.awt.*;

public abstract class ShapeC {
    private Color shapeColor;
    private int height;
    private int width;

    private int xPosition;
    private int yPosition;
    //Set default speeds
    private int xSpeed = 3;
    private int ySpeed = 3;

    //Abstract methods - Draw and Move
    public abstract void drawShape(Graphics g);

    public abstract void moveShape();

    // Overridden Method - hitbox
    public Rectangle getBounds() {
        return new Rectangle(this.getxPosition(), this.getyPosition(),
                this.getWidth(), this.getHeight());
    }

    //region Getters & Setters
    public int getxSpeed() {
        return xSpeed;
    }
    public void setxSpeed(int xSpeed) {
        this.xSpeed = xSpeed;
    }
    public int getySpeed() {
        return ySpeed;
    }
    public void setySpeed(int ySpeed) {
        this.ySpeed = ySpeed;
    }
    public int getHeight() {
        return height;
    }
    public void setHeight(int height) {
        this.height = height;
    }
    public int getWidth() {
        return width;
    }
    public void setWidth(int width) {
        this.width = width;
    }
    public int getxPosition() {
        return xPosition;
    }
    public void setxPosition(int xPosition) {
        this.xPosition = xPosition;
    }
    public int getyPosition() {
        return yPosition;
    }
    public void setyPosition(int yPosition) {
        this.yPosition = yPosition;
    }
    public Color getShapeColor() {
        return shapeColor;
    }
    public void setShapeColor(Color shapeColor) {
        this.shapeColor = shapeColor;
    }
    //endregion


}
