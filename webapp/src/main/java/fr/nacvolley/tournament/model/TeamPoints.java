package fr.nacvolley.tournament.model;

/**
 * Created by faure on 27/04/14.
 */
public class TeamPoints {

    // Données pour les tableaux de classement
    // Non persistentes, juste pour stocker les calculs

    public int points; // Total des points
    public int matchsPlayed; // Nb de matchs joués
    public int matchsWon; // Nb de matchs gagnés
    public int matchsNul; // Nb de matchs nuls
    public int matchsLost; // Nb de matchs perdus
    public int pointsWon; // Nb de points gagnés
    public int pointsLost; // Nb de points perdus
    public int pointsDiff; // Diff de points

}
