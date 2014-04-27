<%
    if (session.getAttribute("admin") != null) {
        session.removeAttribute("admin");
    }
    response.sendRedirect("admin.jsp");
%>
