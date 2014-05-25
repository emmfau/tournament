package fr.nacvolley.tournament.model;

import com.orientechnologies.orient.object.db.OObjectDatabaseTx;
import fr.nacvolley.tournament.util.Db;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

public class Group {

    public static Comparator<Team> qualifGroupComparator = new Comparator<Team>() {
        public int compare(Team t1, Team t2) {
            return t2.getTeamPoints().points - t1.getTeamPoints().points; // Descending order
        }
    };
    public static Comparator<Team> qualifEditComparator = new Comparator<Team>() {
        public int compare(Team t1, Team t2) {
            int t2Level = t2.getLevel();
            int t1Level = t1.getLevel();

            int levelComparison = t2Level - t1Level;
            if (levelComparison != 0) {
                return levelComparison;
            } else {
                // random stuff :)
                return (int) (Math.random() * 10 - 5);
            }
        }
    };
    String id = UUID.randomUUID().toString();
    List<String> teamsIds = new ArrayList<String>();
    List<Match> matchs = new ArrayList<Match>();
    List<Tour> finalTours = new ArrayList<Tour>();

    public List<Match> getMatchs() {
        return matchs;
    }

    public void setMatchs(List<Match> matchs) {
        this.matchs = matchs;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<String> getTeamsIds() {
        return teamsIds;
    }

    public void setTeamsIds(List<String> teamsIds) {
        this.teamsIds = teamsIds;
    }

    public TeamPoints computeTeamPoints(String teamId) {
        TeamPoints tp = new TeamPoints();
        for (Match m : getMatchs()) {
            if (teamId != null && teamId.equals(m.getTeam1Id())) {
                tp.matchsPlayed++;
                if (m.getScore1() > m.getScore2()) { // Gagné
                    tp.points += 3;
                    tp.matchsWon++;
                    tp.pointsWon += m.getScore1();
                    tp.pointsLost += m.getScore2();
                    tp.pointsDiff = tp.pointsWon - tp.pointsLost;
                } else if (m.getScore1() == m.getScore2()) { // Nul
                    tp.points += 1;
                    tp.pointsWon += m.getScore1();
                    tp.pointsLost += m.getScore2();
                    tp.pointsDiff = tp.pointsWon - tp.pointsLost;
                } else { // Perdu
                    tp.points += 0;
                    tp.matchsLost++;
                    tp.pointsWon += m.getScore1();
                    tp.pointsLost += m.getScore2();
                    tp.pointsDiff = tp.pointsWon - tp.pointsLost;
                }
            }
            if (teamId != null && teamId.equals(m.getTeam2Id())) { // Gagné
                tp.matchsPlayed++;
                if (m.getScore2() > m.getScore1()) {
                    tp.points += 3;
                    tp.matchsWon++;
                    tp.pointsWon += m.getScore2();
                    tp.pointsLost += m.getScore1();
                    tp.pointsDiff = tp.pointsWon - tp.pointsLost;
                } else if (m.getScore2() == m.getScore1()) { // Nul
                    tp.points += 1;
                    tp.pointsWon += m.getScore2();
                    tp.pointsLost += m.getScore1();
                    tp.pointsDiff = tp.pointsWon - tp.pointsLost;
                } else {
                    tp.points += 0;
                    tp.matchsLost++;
                    tp.pointsWon += m.getScore2();
                    tp.pointsLost += m.getScore1();
                    tp.pointsDiff = tp.pointsWon - tp.pointsLost;
                }
            }
        }
        return tp;
    }

    public List<Tour> getFinalTours() {
        return finalTours;
    }

    /*
    // Lecture uniquement
    public List<List<Match>> getFinalTours(Tournament tournament) {
        finalMatchs = new ArrayList<List<Match>>();
        // init recursivity
        List<Match> currentTour = new ArrayList<Match>();
        for (Match match : matchs) {
            Team team1 = tournament.searchTeam(match.getTeam1Id());
            Team team2 = tournament.searchTeam(match.getTeam2Id());
            currentTour.add(match);

        }
        return null;
    }

    // parcours l'arbre => mais ne le crée pas : le met à jour.
    private List<Match> getNextTour(List<Match> currentTour) {
        List<Match> nextTour = new ArrayList<Match>();
        for (Match match : currentTour) {
            // Si le match est fini, on peut prendre l'équipe gagnante pour le prochain tour
            if (match.getState().equals(Match.END)) {
                // Récupérer le vainqueur
            }
            // Sinon équipe encore inconnue mais on met quand même un match sans équipe !
            else {

            }
            // D'abord enregistrer le tour avant de lancer la nouvelle récursivité
        }
        return nextTour;
    }
    */

    public void createFinalTours() {
        finalTours = new ArrayList<Tour>();
        // init recursivity : start creating first Tour with the matchs basis
        Tour firstTour = new Tour();
        firstTour.setMatchs(matchs);
        createNextTour(firstTour);
        save();
    }

    private void createNextTour(Tour previousTour) {
        // First add currentTour param in global list
        finalTours.add(previousTour);
        Tour currentTour = new Tour();
        Match nextMatch = null;
        int currentMatchNumber = 1;
        for (Match match : previousTour.getMatchs()) {
            if (currentMatchNumber == 1) {
                // Create new Match for this new tour
                nextMatch = new Match();
                nextMatch.setPreviousMatch1(match);
                match.setNextMatch(nextMatch);
                currentMatchNumber = 2;
            } else {
                nextMatch.setPreviousMatch2(match);
                match.setNextMatch(nextMatch);
                currentTour.getMatchs().add(nextMatch);
                currentMatchNumber = 1;
            }
        }
        // Recursivity
        if (previousTour.getMatchs().size() > 1) {
            createNextTour(currentTour);
        }
    }

    public void save() {
        OObjectDatabaseTx db = Db.instance().get();
        db.save(this);
        db.close();
    }


}
