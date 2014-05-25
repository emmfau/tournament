package fr.nacvolley.tournament.model;

import com.orientechnologies.orient.object.db.OObjectDatabaseTx;
import fr.nacvolley.tournament.util.Db;

import javax.persistence.Transient;
import java.util.UUID;

public class Team {

    public static String FICTIVE = "FICTIVE"; // Used for fictive teams in first tours of finals
    String id = UUID.randomUUID().toString();
    String name = new String();
    String captainName = new String();
    String playersNames = new String();
    String phone = new String();
    String email = new String();
    String club = new String();
    int level = 5; // Note sur 10 : 0= non définir, 1 is amateur, 10 is pro
    String photo = new String(); // url ?
    String state = new String(); // pr�inscrit, inscrit, pay�
    String comments = new String();
    @Transient
    TeamPoints teamPoints;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCaptainName() {
        return captainName;
    }

    public void setCaptainName(String captainName) {
        this.captainName = captainName;
    }

    public String getPlayersNames() {
        return playersNames;
    }

    public void setPlayersNames(String playersNames) {
        this.playersNames = playersNames;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getClub() {
        return club;
    }

    public void setClub(String club) {
        this.club = club;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public TeamPoints getTeamPoints() {
        return teamPoints;
    }

    public void setTeamPoints(TeamPoints teamPoints) {
        this.teamPoints = teamPoints;
    }

    public void save() {
        OObjectDatabaseTx db = Db.instance().get();
        db.save(this);
        db.close();
    }

}
