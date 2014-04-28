package fr.nacvolley.tournament.model;

import com.orientechnologies.orient.core.sql.query.OSQLSynchQuery;
import com.orientechnologies.orient.object.db.OObjectDatabaseTx;
import fr.nacvolley.tournament.util.Db;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class Tournament {

    String id = UUID.randomUUID().toString();

    String name = new String();
    Date date;
    String comments = new String();
    String password = new String();

    // All teams
    List<Team> teams = new ArrayList<Team>();

    // Qualif phase : default params for 24 teams
    List<Group> qualifGroups = new ArrayList<Group>();
    int qualifNbGroups = 6;
    int qualifNbTeamsPerGroup = 4;
    int qualifNbHeadersPerGroup = 1;
    int qualifNbGrounds = 3;
    String qualifStartTime = "20:00"; //hh:mm format
    int qualifMatchTime = 10; // mn
    int qualifPauseTime = 3; // mn
    int qualifPointsForVictory = 3;
    int qualifPointsForNull = 1;
    int qualifPointsForDefeat = 0;

    // Final phase params : default params for 2 finals (principal, consolante)
    List<Group> finalGroups = new ArrayList<Group>();
    int finalNbGroups = 2;
    int finalNbTeamsPerGroup = 12;
    int finalNbGrounds = 3;
    String finalStartTime = "23:00"; //hh:mm format
    int finalMatchTime = 12;
    int finalPauseTime = 3;

    public static List<Tournament> listAll() {
        OObjectDatabaseTx db = Db.instance().get();
        List<Tournament> results = db.query(new OSQLSynchQuery<Tournament>("select * from Tournament"));
        db.close();
        return results;
    }

    public static Tournament load(String id) {
        OObjectDatabaseTx db = Db.instance().get();
        List<Tournament> results = db.query(new OSQLSynchQuery<Tournament>("select * from Tournament where id='" + id + "'"));
        db.close();
        if (results.size() > 0) {
            return results.get(0);
        } else {
            return null;
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public int getQualifNbGroups() {
        return qualifNbGroups;
    }

    public void setQualifNbGroups(int qualifNbGroups) {
        this.qualifNbGroups = qualifNbGroups;
    }

    public int getQualifNbTeamsPerGroup() {
        return qualifNbTeamsPerGroup;
    }

    public void setQualifNbTeamsPerGroup(int qualifNbTeamsPerGroup) {
        this.qualifNbTeamsPerGroup = qualifNbTeamsPerGroup;
    }

    public int getQualifNbHeadersPerGroup() {
        return qualifNbHeadersPerGroup;
    }

    public void setQualifNbHeadersPerGroup(int qualifNbHeadersPerGroup) {
        this.qualifNbHeadersPerGroup = qualifNbHeadersPerGroup;
    }

    public int getQualifNbGrounds() {
        return qualifNbGrounds;
    }

    public void setQualifNbGrounds(int qualifNbGrounds) {
        this.qualifNbGrounds = qualifNbGrounds;
    }


    public int getQualifMatchTime() {
        return qualifMatchTime;
    }

    public void setQualifMatchTime(int qualifMatchTime) {
        this.qualifMatchTime = qualifMatchTime;
    }

    public int getQualifPauseTime() {
        return qualifPauseTime;
    }

    public void setQualifPauseTime(int qualifPauseTime) {
        this.qualifPauseTime = qualifPauseTime;
    }

    public int getQualifPointsForVictory() {
        return qualifPointsForVictory;
    }

    public void setQualifPointsForVictory(int qualifPointsForVictory) {
        this.qualifPointsForVictory = qualifPointsForVictory;
    }

    public int getQualifPointsForNull() {
        return qualifPointsForNull;
    }

    public void setQualifPointsForNull(int qualifPointsForNull) {
        this.qualifPointsForNull = qualifPointsForNull;
    }

    public int getQualifPointsForDefeat() {
        return qualifPointsForDefeat;
    }

    public void setQualifPointsForDefeat(int qualifPointsForDefeat) {
        this.qualifPointsForDefeat = qualifPointsForDefeat;
    }

    public int getFinalNbGroups() {
        return finalNbGroups;
    }

    public void setFinalNbGroups(int finalNbGroups) {
        this.finalNbGroups = finalNbGroups;
    }

    public int getFinalNbTeamsPerGroup() {
        return finalNbTeamsPerGroup;
    }

    public void setFinalNbTeamsPerGroup(int finalNbTeamsPerGroup) {
        this.finalNbTeamsPerGroup = finalNbTeamsPerGroup;
    }

    public int getFinalNbGrounds() {
        return finalNbGrounds;
    }

    public void setFinalNbGrounds(int finalNbGrounds) {
        this.finalNbGrounds = finalNbGrounds;
    }

    public String getQualifStartTime() {
        return qualifStartTime;
    }

    public void setQualifStartTime(String qualifStartTime) {
        this.qualifStartTime = qualifStartTime;
    }

    public String getFinalStartTime() {
        return finalStartTime;
    }

    public void setFinalStartTime(String finalStartTime) {
        this.finalStartTime = finalStartTime;
    }

    public int getFinalMatchTime() {
        return finalMatchTime;
    }

    public void setFinalMatchTime(int finalMatchTime) {
        this.finalMatchTime = finalMatchTime;
    }

    public int getFinalPauseTime() {
        return finalPauseTime;
    }

    public void setFinalPauseTime(int finalPauseTime) {
        this.finalPauseTime = finalPauseTime;
    }

    public List<Team> getTeams() {
        return teams;
    }

    public void setTeams(List<Team> teams) {
        this.teams = teams;
    }

    public List<Group> getQualifGroups() {
        return qualifGroups;
    }

    public void setQualifGroups(List<Group> qualifGroups) {
        this.qualifGroups = qualifGroups;
    }

    public List<Group> getFinalGroups() {
        return finalGroups;
    }

    public void setFinalGroups(List<Group> finalGroups) {
        this.finalGroups = finalGroups;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void save() {
        OObjectDatabaseTx db = Db.instance().get();
        db.save(this);
        db.close();
    }

    public Team searchTeam(String teamId) {
        for (Team t : getTeams()) {
            if (t.getId().equals(teamId)) {
                return t;
            }
        }
        return null; // if no team found, return null
    }


}
