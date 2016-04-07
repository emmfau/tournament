package fr.nacvolley.tournament.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import fr.nacvolley.tournament.util.Db;
import fr.nacvolley.tournament.util.TournamentRepository;
import org.ektorp.DocumentNotFoundException;
import org.ektorp.support.CouchDbDocument;
import org.ektorp.support.TypeDiscriminator;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Tournament extends CouchDbDocument {

    public static final int ALL_PHASES=0;

    public static final int PHASE_OPENING=1;
    public static final int PHASE_PREPARING_QUALIFS=2;
    public static final int PHASE_PLAYING_QUALIFS=3;
    public static final int PHASE_PREPARING_FINALS=4;
    public static final int PHASE_PLAYING_FINALS=5;
    public static final int PHASE_ENDING=6;

    String id = UUID.randomUUID().toString();

    String name = new String();
    Date date;
    String comments = new String();
    String password = new String();

    @TypeDiscriminator
    int typeTournament=1;

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

    int qualifTeamsInFinalPrincipal = 2; // Les 2 premi�res �quipes de poules prises par d�faut en principale

    // TV paramètres
    Tv tv= new Tv(); // default tv s

    public static List<Tournament> listAll() {
        List<Tournament> results=TournamentRepository.instance.getAll();
        return results;
    }

    public static Tournament load(String id) {
        Tournament result;
        try {
            result=TournamentRepository.instance.get(id);
        }
        catch (DocumentNotFoundException dnfe) {
            result=null;
        }
        return result;

    }

    public int getQualifTeamsInFinalPrincipal() {
        return qualifTeamsInFinalPrincipal;
    }

    public void setQualifTeamsInFinalPrincipal(int qualifTeamsInFinalPrincipal) {
        this.qualifTeamsInFinalPrincipal = qualifTeamsInFinalPrincipal;
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
        TournamentRepository tournamentRepository=new TournamentRepository(Db.instance.db);
        try  {
            tournamentRepository.get(getId());
            // Document found => update it
            tournamentRepository.update(this);
        }
        catch (DocumentNotFoundException dnfe) {
            // Document not found => add it
            tournamentRepository.add(this);
        }
    }

    public Team searchTeam(String teamId) {
        for (Team t : getTeams()) {
            if (t.getId().equals(teamId)) {
                return t;
            }
        }
        return null; // if no team found, return null
    }

    public Tv getTv() {
        return tv;
    }

    public void setTv(Tv tv) {
        this.tv = tv;
    }

    public int getTypeTournament() {
        return typeTournament;
    }

    public void setTypeTournament(int typeTournament) {
        this.typeTournament = typeTournament;
    }
}
