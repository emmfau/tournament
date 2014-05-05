<%@page import="fr.nacvolley.tournament.model.Tournament,fr.nacvolley.tournament.util.Randomizer" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);

    tn.getTeams().add(Randomizer.createRandomTeam());
    tn.save();

    response.sendRedirect("teams.jsp#teamCreated");
%>
