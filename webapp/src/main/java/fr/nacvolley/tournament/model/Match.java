package fr.nacvolley.tournament.model;

import java.util.Date;
import java.util.UUID;

public class Match {

    public final static String WAIT = "wait";
    String state = WAIT;
    public final static String PLAY = "play";
    public final static String END = "end";
    String id = UUID.randomUUID().toString();
    String team1Id = new String();
    int score1;
    String team2Id = new String();
    int score2;
    Date startTime;
    String field = new String();

    // For finals only
    String nextMatchId;
    String previousMatch1Id;
    String previousMatch2Id;

    public String getNextMatchId() {
        return nextMatchId;
    }

    public void setNextMatchId(String nextMatchId) {
        this.nextMatchId = nextMatchId;
    }

    public String getPreviousMatch1Id() {
        return previousMatch1Id;
    }

    public void setPreviousMatch1Id(String previousMatch1Id) {
        this.previousMatch1Id = previousMatch1Id;
    }

    public String getPreviousMatch2Id() {
        return previousMatch2Id;
    }

    public void setPreviousMatch2Id(String previousMatch2Id) {
        this.previousMatch2Id = previousMatch2Id;
    }

    /*
    Match nextMatch;
    Match previousMatch1;
    Match previousMatch2;

    public Match getNextMatch() {
        return nextMatch;
    }

    public void setNextMatch(Match nextMatch) {
        this.nextMatch = nextMatch;
    }

    public Match getPreviousMatch1() {
        return previousMatch1;
    }

    public void setPreviousMatch1(Match previousMatch1) {
        this.previousMatch1 = previousMatch1;
    }

    public Match getPreviousMatch2() {
        return previousMatch2;
    }

    public void setPreviousMatch2(Match previousMatch2) {
        this.previousMatch2 = previousMatch2;
    }
    */


    public int getScore1() {
        return score1;
    }

    public void setScore1(int score1) {
        this.score1 = score1;
    }

    public int getScore2() {
        return score2;
    }

    public void setScore2(int score2) {
        this.score2 = score2;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTeam1Id() {
        return team1Id;
    }

    public void setTeam1Id(String team1Id) {
        this.team1Id = team1Id;
    }

    public String getTeam2Id() {
        return team2Id;
    }

    public void setTeam2Id(String team2Id) {
        this.team2Id = team2Id;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void save() {
        //TODO
    }

}

