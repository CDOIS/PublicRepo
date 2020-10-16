package ca.nscc.Classes;

import javax.annotation.PostConstruct;
import javax.swing.*;

public class Player extends Character {

    //Declare circle-specific properties
    private String name;
    private String equipname;

    //Constructors

    public Player(int hitPoint, int defense, int agility, int baseAttack) {
        super(hitPoint, defense, agility, baseAttack);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEquipname() {
        return equipname;
    }

    public void setEquipname(String equipname) {
        this.equipname = equipname;
    }
}
