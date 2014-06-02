<%@page import="fr.nacvolley.tournament.model.Group,fr.nacvolley.tournament.model.Tournament" %>
<%@ page import="java.util.ArrayList" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);

    tn.setQualifGroups(new ArrayList<Group>());
    tn.setFinalGroups(new ArrayList<Group>());
    tn.save();

    response.sendRedirect("qualifs.jsp");
%>
