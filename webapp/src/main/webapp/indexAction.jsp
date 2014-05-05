<%
    String id = (String) request.getParameter("id");
    session.setAttribute("tournamentId", id);
    session.removeAttribute("admin");
    response.sendRedirect("tournament.jsp");
%>
