package nscc.ca;
import java.util.*;



public class Main {

    public static void main(String[] args) {
    	// Object arrays and variables initiation;
        Teams[] teamsArray = new Teams[3];
        Players[] playersArray = new Players[9];
        float teamBudget;
        final int MAXbudget = 100000;
        int i = 0;
        int pflag = 0;
        String teamName;
        String[] Array = new String[3];

        // User input;
        System.out.println("FANTASY HOCKEY APPLICATION");
        System.out.println("TEAM ENTRY");
        System.out.println("=====================================");

        do {
            System.out.printf("Enter name for Team #%s:\n", i+1);
            Scanner usrInput = new Scanner(System.in);
            String nameT = usrInput.nextLine();
            //DATA VALIDATION FUNCTION - "DATAVAL"
            while (!dataVal(nameT)) {
                System.out.println("Enter a valid name, at least 3 characters long.");
                nameT = usrInput.nextLine();
            }
            //RANDOM BUDGET - SET;
            Random rand = new Random();
            teamBudget = rand.nextInt(MAXbudget);
            teamsArray[i] = new Teams(nameT, teamBudget, "0", 0, 0, 0);
            i++;
        } while (i < 3);
        //COUNTER RESET
        i = 0;
        System.out.println("PLAYER ENTRY");
        System.out.println("=====================================");

        do {
            for (Teams currentTeam:teamsArray) {
                teamName = currentTeam.getName();
                System.out.println("Enter Players for " + teamName + ":\n");
                i++;
                for (int c = 0; c < 3; c++) {
                    System.out.printf("Enter name for player # %s:\n", c+1);
                    Scanner usrInput = new Scanner(System.in);
                    String nameP = usrInput.nextLine();
                    while (!dataVal(nameP)) {
                        System.out.println("Enter a valid name, at least 3 characters long.");
                        nameP = usrInput.nextLine();
                    }
                    System.out.printf("Enter number of goals for %s:\n", nameP);
                    Scanner usrInput2 = new Scanner(System.in);
                    String usrpGoals = usrInput2.nextLine();
                    while (!intVal(usrpGoals)){
                        System.out.println("Please enter a number.");
                        usrpGoals = usrInput2.nextLine();
                    }
                    System.out.printf("Enter number of assists for %s:\n", nameP);
                    Scanner usrInput3 = new Scanner(System.in);
                    String usrpAssists = usrInput3.nextLine();
                    while (!intVal(usrpAssists)) {
                        System.out.println("Please enter a number.");
                        usrpAssists = usrInput2.nextLine();
                    }
                    int pGoals = Integer.parseInt(usrpGoals);
                    int pAssists = Integer.parseInt(usrpAssists);
                    playersArray[pflag] = new Players(nameP, pGoals, pAssists, teamName, (pGoals+pAssists));
                    currentTeam.setTotalGoals((currentTeam.getTotalGoals()+pGoals));
                    currentTeam.setTotalAssists((currentTeam.getTotalAssists()+pAssists));
                    currentTeam.setTotalPlays((currentTeam.getTotalPlays()+(pGoals+pAssists)));
                    pflag ++;
                }
            }
        } while (i < 3);

        System.out.println("\nREPORT: Stats per Team");
        System.out.println("=====================================");
        for (Teams currentTeam:teamsArray) {
            float dispBudget = currentTeam.getBudget();
            int totalPlay = currentTeam.getTotalPlays();
            if (totalPlay > 20) {
                currentTeam.setRating("***");
            } else if (totalPlay >= 10){
                currentTeam.setRating("**");
            } else if (totalPlay > 0){
                currentTeam.setRating("*");
            } else {
                currentTeam.setRating("0");
            }
            String dispRating = currentTeam.getRating();
            teamName = currentTeam.getName();
            int goals = currentTeam.getTotalGoals();
            int assists = currentTeam.getTotalAssists();
            int plays = currentTeam.getTotalPlays();

            String budgetFormat = String.format("%.2f", dispBudget);
            System.out.println(teamName + ":G - " + goals + "\tA - " + assists + "\tTotal - " + plays + "\tBudget = $" + budgetFormat);
            System.out.println("Rating: " + dispRating + " starts");
        }
        System.out.println("\nREPORT: Stats per Player");
        System.out.println("=====================================");

        for (Players currentPlayer:playersArray) {
            String repTName = currentPlayer.getTeamName();
            String repPname = currentPlayer.getName();
            int repPGoals = currentPlayer.getGoals();
            int repPAssists = currentPlayer.getAssists();
            int repPPlays = currentPlayer.getTotalPlays();
            System.out.println(repTName);
            System.out.println(repPname + ":\t\tG - " + repPGoals + "\tA - " + repPAssists + "\tTotal - " + repPPlays + ".");
        }
    }

    public static boolean dataVal(String input){
        if(input.length() < 3)
            return false;
        return true;
    }

    public static boolean intVal(String input){
        try {
            Integer i = Integer.parseInt(input);
            if (i <= -1) {
                return false;
            }
        }
        catch(NumberFormatException e) {
            return false;
        }
        return true;
    }

}
