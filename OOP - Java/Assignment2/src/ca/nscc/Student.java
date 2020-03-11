package ca.nscc;

public class Student extends Person {
    private int year;
    private double fee;

    public Student(String name, String address, int year) {
        super(name, address);
        this.year = year;
        switch (year) { //FEES ACCORDING TO CHOSEN YEAR
            case 1:
                this.fee = 3000.00;
                break;
            case 2:
                this.fee = 3100.00;
                break;
            case 3:
                this.fee = 3200.00;
                break;
            case 4:
                this.fee = 3300.00;
                break;
        }
    }

    public double getFee() {
        return fee;
    }

    @Override

    public String toString() {
        String decimalFee = String.format("%.2f",fee);
        return "Name = " + getName() + ", Address = " + getAddress() +
                ", St.Year = " + year + ", fee = $" + decimalFee +".\n";
    }
}
