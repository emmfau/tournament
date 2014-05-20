<%@page import="fr.nacvolley.tournament.model.Group,fr.nacvolley.tournament.model.Match" %>
<%@ page import="fr.nacvolley.tournament.model.Team" %>
<%@ page import="fr.nacvolley.tournament.model.Tournament" %>
<jsp:include page="header.jsp"/>


<h1>
    Qualifications : finales
</h1>

<table class="table table-striped table-condensed">
    <thead>

    </thead>
    <tbody>
    <%
        String tournamendId = (String) session.getAttribute("tournamentId");
        Tournament tn = Tournament.load(tournamendId);

        for (Group group : tn.getFinalGroups()) {
            for (Match pmatch : group.getMatchs()) {
                Team team1 = tn.searchTeam(pmatch.getTeam1Id());
                Team team2 = tn.searchTeam(pmatch.getTeam2Id());

    %>
    <tr>
        <td>
            <%=team1.getName()%> vs <%=team2.getName()%>

        </td>

    </tr>

    <%
        }
    %>
    <tr>
        <td>XXX</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>


<% if (tn.getFinalGroups().size() == 0) { %>
<div class="alert alert-warning alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <strong>Info</strong> Aucun groupe de finale n'est créé pour le moment.
</div>
<% } %>

<jsp:include page="footer.jsp"/>