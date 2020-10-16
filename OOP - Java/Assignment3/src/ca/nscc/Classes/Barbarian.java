package ca.nscc.Classes;

import javax.swing.*;

public class Barbarian extends Player {
    private String clname = "Barbarian";
    private ImageIcon barbarianIcon;
    private String barbarianDesc = "He is a frenzied beast!";

    public Barbarian(int hitPoint, int defense, int agility, int baseAttack) {
        super(hitPoint, defense, agility, baseAttack);
        barbarianIcon = new ImageIcon(this.getClass().getResource("/Images" +
                "/barbarian.png"));
    }

    public ImageIcon getBarbarianIcon() {
        return barbarianIcon;
    }

    public String getBarbarianDesc() {
        return barbarianDesc;
    }
    @Override
    public String toString() {
        return "Player= "+ getName() + "\n-----------\n" +
                "Class Name= " + clname + " hitpoint=" + getHitPoint() +
                ", defense=" + getDefense() +
                ", agility=" + getAgility() +
                ", baseAttack=" + getBaseAttack() +
                "}\n";
    }
}
