package fr.nacvolley.tournament.model;

import java.util.UUID;

/**
 * Created by emmfau on 09/05/15.
 */
public class TvScreen {

    String id = UUID.randomUUID().toString();
    String htmlContent=""; // Reveal.js format !
    String background=""; // color
    String photo=""; // image url for 'section' tag
    int linkedPhase=0; // linked phase to make this screen appears  (default = all phases !)

    public String getHtmlContent() {
        return htmlContent;
    }

    public void setHtmlContent(String htmlContent) {
        this.htmlContent = htmlContent;
    }

    public String getBackground() {
        return background;
    }

    public void setBackground(String background) {
        this.background = background;
    }

    public int getLinkedPhase() {
        return linkedPhase;
    }

    public void setLinkedPhase(int linkedPhase) {
        this.linkedPhase = linkedPhase;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
}
