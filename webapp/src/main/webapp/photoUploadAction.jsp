<%@page import="fr.nacvolley.tournament.model.Team,fr.nacvolley.tournament.model.Tournament" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);
    String teamId = (String) request.getAttribute("teamId"); // Attr, not parameter (because just forwarded from servlet)

    String uuid=(String)request.getAttribute("attachmentId");
    String name=(String)request.getAttribute("attachmentName");

    Team team = tn.searchTeam(teamId);
    team.setPhoto(uuid+"/"+name);
    tn.save();

    response.sendRedirect("teams.jsp");
%>