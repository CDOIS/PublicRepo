package ca.nscc.Classes;

import javax.swing.*;

public class Monster extends Character {

    //Declare rectangle-specific properties
    private String race;
    private ImageIcon monsterPic;

    //Constructors

    public Monster(int hitPoint, int defense, int agility, int baseAttack,
                   String race) {
        super(hitPoint, defense, agility, baseAttack);
        this.race = race;
        //Set image for this monster
        monsterPic = new ImageIcon(this.getClass().getResource(
                "/Images/monster.png"));
    }
    public ImageIcon getMonsterPic() {
        return monsterPic;
    }

    @Override
    public String toString() {
        return  "Monster= " + race +
                " hitpoint=" + getHitPoint() +
                ", defense= " + getDefense() +
                ", agility= " + getAgility() +
                ", baseAttack= " + getBaseAttack() +
                '}';
    }


}
