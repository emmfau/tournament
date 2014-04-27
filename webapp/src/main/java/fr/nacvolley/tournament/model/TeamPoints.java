package fr.nacvolley.tournament.model;

/**
 * Created by faure on 27/04/14.
 */
public class TeamPoints {

    // Donn�es pour les tableaux de classement
    // Non persistentes, juste pour stocker les calculs

    public int points; // Total des points
    public int matchsPlayed; // Nb de matchs jou�s
    public int matchsWon; // Nb de matchs gagn�s
    public int matchsNul; // Nb de matchs nuls
    public int matchsLost; // Nb de matchs perdus
    public int pointsWon; // Nb de points gagn�s
    public int pointsLost; // Nb de points perdus
    public int pointsDiff; // Diff de points

}
