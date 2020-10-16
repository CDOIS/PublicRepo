package ca.nscc.Classes;

import javax.annotation.PostConstruct;
import javax.swing.*;

public class Fighter extends Player {

    private String clname = "Fighter";
    private ImageIcon fighterIcon;
    private String fighterDesc = "He knows how to fight!";


    public Fighter(int hitPoint, int defense, int agility, int baseAttack) {
        super(hitPoint, defense, agility, baseAttack);
        fighterIcon = new ImageIcon(this.getClass().getResource("/Images" +
                "/fighter.png"));

    }

    public ImageIcon getFighterIcon() {
        return fighterIcon;
    }

    public String getFighterDesc() {
        return fighterDesc;
    }

    @Override
    public String toString() {
        return "Player= "+ getName() + "\n-----------\n" +
                "Class Name= " + clname + " hitpoint=" + getHitPoint() +
                ", defense= " + getDefense() +
                ", agility= " + getAgility() +
                ", baseAttack= " + getBaseAttack() +
                "}\n";
    }
}
