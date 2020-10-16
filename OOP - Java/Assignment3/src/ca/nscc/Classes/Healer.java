package ca.nscc.Classes;

import javax.swing.*;

public class Healer extends Player {
    private String clname = "Healer";
    private ImageIcon healerIcon;
    private String healerDesc = "He cleans and heal!";

    public Healer(int hitPoint, int defense, int agility, int baseAttack) {
        super(hitPoint, defense, agility, baseAttack);
        healerIcon = new ImageIcon(this.getClass().getResource("/Images" +
                "/healer.png"));
    }

    public ImageIcon getHealerIcon() {
        return healerIcon;
    }

    public String getHealerDesc() {
        return healerDesc;
    }
    @Override
    public String toString() {
        return "Plater= "+ getName() + "\n-----------\n" +
                "Class Name= " + clname + " hitpoint=" + getHitPoint() +
                ", defense=" + getDefense() +
                ", agility=" + getAgility() +
                ", baseAttack=" + getBaseAttack() +
                "}\n";
    }
}
