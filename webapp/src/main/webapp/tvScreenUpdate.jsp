<%@page import="fr.nacvolley.tournament.model.*" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);

    boolean isNew = (request.getParameter("isNew") != null);
    TvScreen screen;

    if (isNew) { // create
        screen = new TvScreen(); // with fresh teamId
    } else { // update
        String screenId = (String) request.getParameter("screenId");
        screen = tn.getTv().searchTvScreen(screenId);
    }

    screen.setHtmlContent((String)request.getParameter("htmlContent"));
    screen.setBackground((String)request.getParameter("background"));
    screen.setLinkedPhase(Integer.parseInt((String) request.getParameter("linkedPhase")));

    if (isNew) {
        tn.getTv().getScreens().add(screen);

    }
    tn.save();

    response.sendRedirect("tvEdit.jsp");
%>
