<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<jsp:include page="header.jsp"/>
<%
  SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm"); // ou "d/M - HH:mm"
%>
<h1>EXPORT DE <%=dateFormat.format(new Date())%></h1>
<hr>
<jsp:include page="teams.jsp"/>
<hr>
<jsp:include page="qualifs.jsp"/>
<hr>
<jsp:include page="qualifMatchs.jsp"/>
<hr>
<jsp:include page="finals.jsp"/>
<hr>

<jsp:include page="footer.jsp"/>
