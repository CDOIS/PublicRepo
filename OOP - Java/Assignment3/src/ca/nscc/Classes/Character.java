package ca.nscc.Classes;

public abstract class Character {

    //Declare properties of ANY shape

    private int equip;
    private int hitPoint;
    private int defense;
    private int agility;
    private int baseAttack;

    public Character(int hitPoint, int defense, int agility, int baseAttack) {
        this.hitPoint = hitPoint;
        this.defense = defense;
        this.agility = agility;
        this.baseAttack = baseAttack;
        this.equip = 0;
    }

    public int getEquip() {
        return equip;
    }

    public void setEquip(int equip) {
        this.equip = equip;
    }

    public int getHitPoint() {
        return hitPoint;
    }

    public void setHitPoint(int hitPoint) {
        this.hitPoint = hitPoint;
    }

    public int getDefense() {
        return defense;
    }

    public void setDefense(int defense) {
        this.defense = defense;
    }

    public int getAgility() {
        return agility;
    }

    public void setAgility(int agility) {
        this.agility = agility;
    }

    public int getBaseAttack() {
        return baseAttack;
    }

    public void setBaseAttack(int baseAttack) {
        this.baseAttack = baseAttack;
    }

    //Define a getArea() method, to be inherited by subclasses


    @Override
    public String toString() {
        return "Character{"+
                "hitPoint=" + hitPoint +
                ", defense=" + defense +
                ", agility=" + agility +
                ", baseAttack=" + baseAttack +
                '}';
    }
}
