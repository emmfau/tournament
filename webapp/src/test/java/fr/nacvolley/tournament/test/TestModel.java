package fr.nacvolley.tournament.test;

import fr.nacvolley.tournament.model.Group;
import fr.nacvolley.tournament.model.Match;
import fr.nacvolley.tournament.model.Team;
import fr.nacvolley.tournament.model.Tournament;
import junit.framework.TestCase;

import java.util.Date;

public class TestModel extends TestCase {

    public void testInitialisation() {

        Tournament tn = new Tournament();
        tn.setDate(new Date(2014, 6, 6));
        tn.setName("Tournoi 2014 du NAC Volley");
        tn.setPassword("tournoi");

        Team team1 = new Team();
        team1.setName("Les moustaches");
        team1.setCaptainName("Emmanuel FAURE");
        team1.setClub("NAC Volley");
        team1.setLevel(10);

        Team team2 = new Team();
        team2.setName("Les chouchous");
        team2.setCaptainName("Pat RICHARD");
        team2.setClub("NAC Volley");
        team2.setLevel(12);

        Team team3 = new Team();
        team3.setName("Les judokas");
        team3.setCaptainName("Ludo JUDO");
        team3.setLevel(2);

        Team team4 = new Team();
        team4.setName("Jeu set et match");
        team4.setCaptainName("Fabrice TENNIS");
        team4.setLevel(6);

        tn.getTeams().add(team1);
        tn.getTeams().add(team2);
        tn.getTeams().add(team3);
        tn.getTeams().add(team4);


        Group poule1 = new Group();
        poule1.getTeamsIds().add(team1.getId());
        poule1.getTeamsIds().add(team2.getId());

        Group poule2 = new Group();
        poule2.getTeamsIds().add(team3.getId());
        poule2.getTeamsIds().add(team4.getId());

        tn.getQualifGroups().add(poule1);
        tn.getQualifGroups().add(poule2);

        Match match374 = new Match();
        match374.setTeam1Id(team1.getId());
        match374.setTeam2Id(team2.getId());
        match374.setScore1(15);
        match374.setScore2(10);
        match374.setStartTime(new Date());

        poule1.getMatchs().add(match374);

        tn.save();
    }

}
