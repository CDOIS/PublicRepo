package ca.nscc;

public class Staff extends Person{
    private int yearsOfService;
    private double salary;

    public Staff(String name, String address, int yearsOfService) {
        super(name, address);
        this.yearsOfService = yearsOfService;
        this.salary = (50000 + (yearsOfService * 500));
    }

    public double getSalary() {
        return salary;
    }

    @Override
    public String toString() {

        String decimalFee = String.format("%.2f",salary);

        return "Name = " + getName() + ", Address = " + getAddress() +
                ", St.Year = " + yearsOfService + ", fee = $" + decimalFee +".\n";
    }
}
