package ca.nscc.Classes;
import javax.swing.*;
public class Equipment {

    private String equipName;
    private int defenseMod;
    private int baseAttackMod;
    private ImageIcon icon;

    public Equipment(String equipName, int defenseMod, int baseAttackMod) {
        this.equipName = equipName;

        this.defenseMod = defenseMod;

        this.baseAttackMod = baseAttackMod;
        switch (equipName) {
            case "Axe":
                this.icon = new ImageIcon(this.getClass().getResource("/Images" +
                        "/axe.png"));
                break;
            case "Gladio":
                this.icon = new ImageIcon(this.getClass().getResource("/Images" +
                        "/gladio.jpg"));
                break;
            case "Staff":
                this.icon = new ImageIcon(this.getClass().getResource("/Images" +
                        "/staff.png"));
                break;
        }
    }

    public ImageIcon getIcon() {
        return icon;
    }

    public String getEquipName() {
        return equipName;
    }

    public void setEquipName(String equipName) {
        this.equipName = equipName;
    }

    public int getDefenseMod() {
        return defenseMod;
    }

    public int getBaseAttackMod() {
        return baseAttackMod;
    }

    @Override
    public String toString() {
        return equipName + ", Defense Modifier= " +
                  defenseMod + ", B. Attack Modifier= " + baseAttackMod +
                "\n";
    }
}
