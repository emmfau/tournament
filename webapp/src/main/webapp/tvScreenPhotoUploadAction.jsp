<%@page import="fr.nacvolley.tournament.model.Team,fr.nacvolley.tournament.model.Tournament" %>
<%@ page import="fr.nacvolley.tournament.model.TvScreen" %>
<%@ page import="java.util.List" %>
<%@ page import="fr.nacvolley.tournament.model.Tv" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);
    String theScreenId = (String) request.getAttribute("theScreenId"); // Attr, not parameter (because just forwarded from servlet)

    String uuid=(String)request.getAttribute("attachmentId");
    String name=(String)request.getAttribute("attachmentName");

    Tv tv=tn.getTv();
    List<TvScreen> screens=tn.getTv().getScreens();
    for (TvScreen screen : screens) {
        if (screen.getId().equals(theScreenId)) {
            screen.setPhoto(uuid+"/"+name);
        }
    }

    tn.save();

    response.sendRedirect("tvEdit.jsp");
%>