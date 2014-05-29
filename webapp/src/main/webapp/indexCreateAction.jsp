<%@ page import="fr.nacvolley.tournament.model.Tournament" %>
<%@ page import="java.util.Date" %>
<%
    Tournament tn = new Tournament();
    tn.setDate(new Date());
    tn.setName((String) request.getParameter("name"));
    tn.setPassword((String) request.getParameter("password"));
    tn.save();
    session.setAttribute("tournamentId", tn.getId());
    session.setAttribute("admin", true);
    response.sendRedirect("admin.jsp");
%>
