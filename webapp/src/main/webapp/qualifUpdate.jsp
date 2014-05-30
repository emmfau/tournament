<%@page import="fr.nacvolley.tournament.model.Tournament" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);

    tn.setQualifNbGroups(Integer.parseInt((String) request.getParameter("qualifNbGroups")));
    //tn.setQualifNbTeamsPerGroup(Integer.parseInt((String) request.getParameter("qualifNbTeamsPerGroup")));
    //tn.setQualifNbGrounds(Integer.parseInt((String) request.getParameter("qualifNbGrounds")));

    tn.setQualifPointsForVictory(Integer.parseInt((String) request.getParameter("qualifPointsForVictory")));
    tn.setQualifPointsForNull(Integer.parseInt((String) request.getParameter("qualifPointsForNull")));
    tn.setQualifPointsForDefeat(Integer.parseInt((String) request.getParameter("qualifPointsForDefeat")));

    //tn.setQualifStartTime((String) request.getParameter("qualifStartTime"));
    //tn.setQualifMatchTime(Integer.parseInt((String) request.getParameter("qualifMatchTime")));
    //tn.setQualifPauseTime(Integer.parseInt((String) request.getParameter("qualifPauseTime")));

    tn.save();

    response.sendRedirect("qualifs.jsp");
%>
