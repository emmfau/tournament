<%@page import="fr.nacvolley.tournament.model.Group,fr.nacvolley.tournament.model.Match" %>
<%@ page import="fr.nacvolley.tournament.model.Tournament" %>

<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    String matchId = (String) request.getParameter("matchId");
    Tournament tn = Tournament.load(tournamendId);

    // Search group and match
    boolean matchFound = false;
    Group currentGroup = null;
    Match currentMatch = null;
    for (Group group : tn.getQualifGroups()) {
        for (Match match : group.getMatchs()) {
            if (match.getId().equals(matchId)) {
                matchFound = true;
                currentGroup = group;
                currentMatch = match;
                break;
            }
        }
        if (matchFound) {
            break;
        }
    }

    currentMatch.setScore1(Integer.parseInt((String) request.getParameter("score1")));
    currentMatch.setScore2(Integer.parseInt((String) request.getParameter("score2")));
    currentMatch.setState((String) request.getParameter("state"));
    currentMatch.setField((String) request.getParameter("field"));
    currentMatch.save();

    response.sendRedirect("qualifMatchs.jsp");
%>


