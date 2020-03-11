package ca.nscc;

public abstract class Person {
    private String Name;
    private String Address;

    public Person(String name, String address) {
        Name = name;
        Address = address;
    }

    public String getName() {
        return Name;
    }

    public String getAddress() {
        return Address;
    }

    @Override
    public String toString() {
        return "Person{" + "Name='" + Name + '\'' + ", Address='" + Address + '\'' + '}';
    }
}
