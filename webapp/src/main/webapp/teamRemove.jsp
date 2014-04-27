<%@page import="fr.nacvolley.tournament.model.Team,fr.nacvolley.tournament.model.Tournament" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);
    String teamId = (String) request.getParameter("teamId");
    Team team = tn.searchTeam(teamId);
    tn.getTeams().remove(team);
    tn.save();

    response.sendRedirect("teams.jsp");
%>
