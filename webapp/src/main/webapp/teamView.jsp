<%@page import="fr.nacvolley.tournament.model.Team,fr.nacvolley.tournament.model.Tournament" %>
<jsp:include page="header.jsp"/>
<%

    String tournamendId = (String) session.getAttribute("tournamentId");
    String teamId = (String) request.getParameter("teamId");
    Tournament tn = Tournament.load(tournamendId);
    Team team = tn.searchTeam(teamId);
%>

<div class="row">
    <h1><%=team.getName()%>
    </h1>
    <%
        String teamPhotoFileName = team.getPhoto();
        if (teamPhotoFileName != null && !teamPhotoFileName.equals("")) {
    %>
    <a href="uploads/<%=teamPhotoFileName%>"><img class="img-responsive" src="uploads/<%=teamPhotoFileName%>"/></a>
    <% } else { %>
    <a href="images/team.jpg"><img src="images/team-thumb.jpg"/></a>
    <% } %>

    <h3>
        <strong><%=team.getCaptainName()%>
        </strong>
        <%=team.getPlayersNames()%>
    </h3>
    <h4><span class="glyphicon glyphicon-map-marker"></span> <%=team.getClub()%>
    </h4>
    <h4><span class="glyphicon glyphicon-comment"></span> <%=team.getComments()%>
    </h4>
    <% if (session.getAttribute("admin") != null) { %>
    <h4><span class="glyphicon glyphicon-phone-alt"></span> <a href="tel:<%=team.getPhone()%>"><%=team.getPhone()%>
    </a></h4>
    <h4><a href="mailto:<%=team.getEmail()%>"><%=team.getEmail()%>
    </a></h4>
    <h4><span class="glyphicon glyphicon-chevron-right"></span> <%=team.getState()%>
    </h4>
    <% } %></div>

<% if (session.getAttribute("admin") != null) { %>
<a href="teamEdit.jsp?teamId=<%=team.getId()%>">
    <button type="button" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-pencil"></span>
        Modifier
    </button>
</a>
<% } %>

<jsp:include page="footer.jsp"/>