<%@page import="fr.nacvolley.tournament.model.Tournament" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);
    String password = request.getParameter("password");
    if (password != null && password.equals(tn.getPassword())) {
        session.setAttribute("admin", true);
        response.sendRedirect("admin.jsp");
    } else {
        response.sendRedirect("admin.jsp?adminError=passwordIncorrect");
    }
%>
