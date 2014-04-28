<%@page import="fr.nacvolley.tournament.model.Group,fr.nacvolley.tournament.model.Team" %>
<%@ page import="fr.nacvolley.tournament.model.Tournament" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<jsp:include page="header.jsp"/>
<script>
    function qualifView(id) {
        window.location.href = "qualifView.jsp?qualifId=" + encodeURIComponent(id);
    }

</script>

<h1>
    Groupes de qualification
    <% if (session.getAttribute("admin") != null) { %>
    <a href="qualifEdit.jsp">
        <button type="button" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-pencil"></span>
        </button>
    </a>
    <a href="qualifGroupsEdit.jsp">
        <button type="button" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-th-large"></span>
        </button>
    </a>
    <% } %>
</h1>

<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);
    for (Group group : tn.getQualifGroups()) {
%>
<h2>Groupe <%=tn.getQualifGroups().indexOf(group)%>
</h2>
<table class="table table-striped table-condensed">
    <thead>
    <tr>
        <th>Equipe</th>
        <th>PTS</th>
        <th>MJ</th>
        <th>MG</th>
        <th>MN</th>
        <th>MP</th>
        <th>P+</th>
        <th>P-</th>
        <th>D</th>

    </tr>
    </thead>
    <tbody>
    <%
        // Récupérer les équipes et calculer leurs points
        List<Team> teams = new ArrayList<Team>();

        for (String teamId : group.getTeamsIds()) {
            Team team = tn.searchTeam(teamId);
            team.setTeamPoints(group.computeTeamPoints(teamId));
            teams.add(team);
        }

        // Trier les équipes selon leurs points
        Collections.sort(teams, Group.qualifGroupComparator);

        for (Team team : teams) {
    %>
    <tr>
        <td>
            <%=team.getName()%>
        </td>
        <td class="success"><strong><%=team.getTeamPoints().points%>
        </strong></td>
        <td><%=team.getTeamPoints().matchsPlayed%>
        </td>
        <td><%=team.getTeamPoints().matchsWon%>
        </td>
        <td><%=team.getTeamPoints().matchsNul%>
        </td>
        <td><%=team.getTeamPoints().matchsLost%>
        </td>
        <td class="info"><%=team.getTeamPoints().pointsWon%>
        </td>
        <td class="info"><%=team.getTeamPoints().pointsLost%>
        </td>
        <td class="info"><%=team.getTeamPoints().pointsDiff%>
        </td>
    </tr>


    <%
        }
    %>


    </tbody>
</table>

<%
    }
%>

<% if (tn.getQualifGroups().size() == 0) { %>
<div class="alert alert-warning alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <strong>Info</strong> Aucun groupe de qualification n'est cr�� pour le moment.
</div>
<% } %>

<jsp:include page="footer.jsp"/>