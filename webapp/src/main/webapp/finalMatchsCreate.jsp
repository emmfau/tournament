<%@page import="fr.nacvolley.tournament.model.Group,fr.nacvolley.tournament.model.Match" %>
<%@ page import="fr.nacvolley.tournament.model.Team" %>
<%@ page import="fr.nacvolley.tournament.model.Tournament" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);

    // Hypothèse : les 2 premiers de chaque poule en phase principale
    int nbTeamsInPrincipal = 2;

    List<Team> mainTeams = new ArrayList<Team>();
    List<Team> otherTeams = new ArrayList<Team>();
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

    mainGroup.setMatchs(mainGroupMatchs);
    otherGroup.setMatchs(otherGroupMatchs);

    tn.setFinalGroups(new ArrayList<Group>());
    tn.getFinalGroups().add(mainGroup);
    tn.getFinalGroups().add(otherGroup);

    tn.save();
    response.sendRedirect("finals.jsp");
%>