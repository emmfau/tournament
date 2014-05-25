package fr.nacvolley.tournament.model;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by faure on 24/05/14.
 */
public class Tour {

    String id = UUID.randomUUID().toString();

    List<Match> matchs = new ArrayList<Match>();

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<Match> getMatchs() {
        return matchs;
    }

    public void setMatchs(List<Match> matchs) {
        this.matchs = matchs;
    }
}
