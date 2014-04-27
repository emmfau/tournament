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

    <h3>
        <strong><%=team.getCaptainName()%>
        </strong>
        <%=team.getPlayersNames()%>
    </h3>
    <h4><a href="tel:<%=team.getPhone()%>"><%=team.getPhone()%>
    </a></h4>
    <h4><a href="mailto:<%=team.getEmail()%>"><%=team.getEmail()%>
    </a></h4>
    <h5><%=team.getClub()%>
    </h5>
    <h5><%=team.getComments()%>
    </h5>
</div>

<h2>Groupe de qualification</h2>

<h3>Matchs</h3>

<h3>Résultats</h3>

<h2>Groupe de finale</h2>

<h3>Matchs</h3>


</div>
<jsp:include page="footer.jsp"/>