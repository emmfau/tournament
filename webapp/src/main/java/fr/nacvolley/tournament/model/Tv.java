package fr.nacvolley.tournament.model;

import com.orientechnologies.orient.object.db.OObjectDatabaseTx;
import fr.nacvolley.tournament.util.Db;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by emmfau on 09/05/15.
 */
public class Tv {

    String id = UUID.randomUUID().toString();

    // Phase actuelle du tournoi
    int phase=Tournament.PHASE_OPENING;

    // Ecrans personnalisés d'actus, de pubs, infos spéciales ou autres
    List<TvScreen> screens=new ArrayList<TvScreen>();

    int delay=5000; // délai en mss

    public int getPhase() {
        return phase;
    }

    public void setPhase(int phase) {
        this.phase = phase;
    }

    public List<TvScreen> getScreens() {
        return screens;
    }

    public void setScreens(List<TvScreen> screens) {
        this.screens = screens;
    }

    public int getDelay() {
        return delay;
    }

    public void setDelay(int delay) {
        this.delay = delay;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public TvScreen searchTvScreen(String screenId) {
        for (TvScreen screen : getScreens()) {
            if (screen.getId().equals(screenId)) {
                return screen;
            }
        }
        return null; // if no screen found, return null
    }

    public void save() {
        OObjectDatabaseTx db = Db.instance().get();
        db.save(this);
        db.close();
    }


}
