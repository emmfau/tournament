<%
    String id = (String) request.getParameter("id");
    session.setAttribute("tournamentId", id);
    response.sendRedirect("tournament.jsp");
%>
