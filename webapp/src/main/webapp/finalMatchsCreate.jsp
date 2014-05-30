<%@page import="fr.nacvolley.tournament.model.Group,fr.nacvolley.tournament.model.Match" %>
<%@ page import="fr.nacvolley.tournament.model.Team" %>
<%@ page import="fr.nacvolley.tournament.model.Tournament" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);
    List<Team> mainTeams = new ArrayList<Team>();
    List<Team> otherTeams = new ArrayList<Team>();
    // Hypothèse : les 2 premiers de chaque poule en phase principale
    int nbTeamsInPrincipal = 2;


    for (Group group : tn.getQualifGroups()) {
        // Récupérer les équipes et calculer leurs points
        List<Team> teams = new ArrayList<Team>();
        for (String teamId : group.getTeamsIds()) {
            Team team = tn.searchTeam(teamId);
            team.setTeamPoints(group.computeTeamPoints(teamId));
            teams.add(team);
        }
        // Trier les équipes selon leurs points
        Collections.sort(teams, Group.qualifGroupComparator);
        for (Team sortedTeam : teams) {
            if (teams.indexOf(sortedTeam) < nbTeamsInPrincipal) {
                mainTeams.add(sortedTeam);
            } else {
                otherTeams.add(sortedTeam);
            }
        }
    }

    /////////// MAIN TEAMS ///////////

    // Ajouter des équipes pour que le nombre de d'équipe soit un multiple d'une puissance de 2
    int powToUse = 1;
    int powResult = (int) Math.pow(2, powToUse);
    while (powResult < mainTeams.size()) {
        //8<7 équipes => c'est 8
        // 8<8 c'est 8 = c'est 8
        //9<8 faux = c'est 16'
        powToUse++;
        powResult = (int) Math.pow(2, powToUse);
    }

    for (int i = mainTeams.size(); i < powResult; i++) {
        Team t = new Team();
        t.setId(Team.FICTIVE);
        mainTeams.add(new Team());
    }

    Collections.shuffle(mainTeams);
    Group mainGroup = new Group();
    List<Match> mainGroupMatchs = new ArrayList<Match>();
    Match pmatch = new Match();
    int currentTeamNumber = 1;
    for (Team mainTeam : mainTeams) {
        if (currentTeamNumber == 1) {
            pmatch.setTeam1Id(mainTeam.getId());
            currentTeamNumber = 2;
        } else {
            pmatch.setTeam2Id(mainTeam.getId());
            mainGroupMatchs.add(pmatch);
            pmatch = new Match();
            currentTeamNumber = 1;
        }
    }


    /////////// OTHER TEAMS ///////////

    // Ajouter des équipes pour que le nombre de d'équipe soit un multiple d'une puissance de 2
    powToUse = 1;
    powResult = (int) Math.pow(2, powToUse);
    while (powResult < otherTeams.size()) {
        //8<7 équipes => c'est 8
        // 8<8 c'est 8 = c'est 8
        //9<8 faux = c'est 16'
        powToUse++;
        powResult = (int) Math.pow(2, powToUse);
    }

    for (int i = otherTeams.size(); i < powResult; i++) {
        Team t = new Team();
        t.setId(Team.FICTIVE);
        otherTeams.add(new Team());
    }

    Collections.shuffle(otherTeams);
    Group otherGroup = new Group();
    List<Match> otherGroupMatchs = new ArrayList<Match>();
    Match omatch = new Match();
    currentTeamNumber = 1;
    for (Team otherTeam : otherTeams) {
        if (currentTeamNumber == 1) {
            omatch.setTeam1Id(otherTeam.getId());
            currentTeamNumber = 2;
        } else {
            omatch.setTeam2Id(otherTeam.getId());
            otherGroupMatchs.add(omatch);
            omatch = new Match();
            currentTeamNumber = 1;
        }
    }


    /////////// RECORD ALL ///////////

    mainGroup.setMatchs(mainGroupMatchs);
    otherGroup.setMatchs(otherGroupMatchs);

    mainGroup.createFinalTours();
    otherGroup.createFinalTours();

    tn.setFinalGroups(new ArrayList<Group>());
    tn.getFinalGroups().add(mainGroup);
    tn.getFinalGroups().add(otherGroup);

    tn.save();
    response.sendRedirect("finals.jsp");
%>