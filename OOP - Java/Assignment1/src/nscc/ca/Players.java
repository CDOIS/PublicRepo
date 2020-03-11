package nscc.ca;

public class Players {
    private String name;
    private int goals;
    private int assists;
    private String teamName;
    private int totalPlays;


    public Players(String name, int goals, int assists, String teamName, int totalPlays) {
        this.name = name;
        this.goals = goals;
        this.assists = assists;
        this.teamName = teamName;
        this.totalPlays = totalPlays;
    }

    public String getName() {
        return name;
    }

    public int getGoals() {
        return goals;
    }

    public int getAssists() {
        return assists;
    }

    public String getTeamName() { return teamName; }

    public int getTotalPlays() { return totalPlays; }

}
