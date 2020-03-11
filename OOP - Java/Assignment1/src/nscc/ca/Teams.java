
package nscc.ca;

public class Teams {

    private String name;
    private float budget;
    private String rating;
    private int totalGoals;
    private int totalAssists;
    private int totalPlays;

    public Teams(String name, float budget, String rating, int totalGoals, int totalAssists, int totalPlays) {
        this.name = name;
        this.budget = budget;
        this.rating = rating;
        this.totalGoals = totalGoals;
        this.totalAssists = totalAssists;
        this.totalPlays = totalPlays;
    }

    public String getName() {
        return name;
    }

    public float getBudget() {
        return budget;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public int getTotalGoals() { return totalGoals; }

    public void setTotalGoals(int totalGoals) { this.totalGoals = totalGoals; }

    public int getTotalAssists() {  return totalAssists;  }

    public void setTotalAssists(int totalAssists) { this.totalAssists = totalAssists;  }

    public int getTotalPlays() { return totalPlays; }

    public void setTotalPlays(int totalPlays) { this.totalPlays = totalPlays; }
}

