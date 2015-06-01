<%@page import="fr.nacvolley.tournament.model.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>

    <%

    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);

    for (TvScreen screen : tn.getTv().getScreens()) {
        if (screen.getLinkedPhase()==Tournament.ALL_PHASES || screen.getLinkedPhase()==tn.getTv().getPhase()) {


        // photo by default, or background else
        String val="";
        if (screen.getPhoto()!=null && !screen.getPhoto().equals("")) {
            val="../uploads/"+screen.getPhoto();
        }
        else {
            val=screen.getBackground();
        }

    %>
    <section data-background="<%=val%>">
        <%=screen.getHtmlContent()%>
    </section>
<%
        }
    }
%>
