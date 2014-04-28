package fr.nacvolley.tournament.model;

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

    String id = UUID.randomUUID().toString();
    List<String> teamsIds = new ArrayList<String>();
    List<Match> matchs = new ArrayList<Match>();

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


}
