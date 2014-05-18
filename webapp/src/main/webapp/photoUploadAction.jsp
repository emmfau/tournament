<%@page import="fr.nacvolley.tournament.model.Team,fr.nacvolley.tournament.model.Tournament" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);
    String teamId = (String) request.getAttribute("teamId"); // Attr, not parameter (because just forwarded from servlet)
    String photo = (String) request.getAttribute("photo");
    Team team = tn.searchTeam(teamId);
    team.setPhoto(photo);
    team.save();
    response.sendRedirect("teams.jsp");
%>