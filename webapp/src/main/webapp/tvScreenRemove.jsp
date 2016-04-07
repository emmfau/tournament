<%@page import="fr.nacvolley.tournament.model.*,fr.nacvolley.tournament.model.Tournament" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);
    String screenId = (String) request.getParameter("screenId");
    TvScreen screen=tn.getTv().searchTvScreen(screenId);
    tn.getTv().getScreens().remove(screen);
    tn.save();

    response.sendRedirect("tvEdit.jsp");
%>
