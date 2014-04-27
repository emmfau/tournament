<%@page import="fr.nacvolley.tournament.model.Team,fr.nacvolley.tournament.model.Tournament" %>
<jsp:include page="header.jsp"/>
<script>
    function teamView(id) {
        window.location.href = "teamView.jsp?teamId=" + encodeURIComponent(id);
    }

</script>

<h1>Equipes</h1>

<table class="table table-striped">
    <thead>
    <tr>
        <th>Nom</th>
        <th>Capitaine</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <%
        String tournamendId = (String) session.getAttribute("tournamentId");
        Tournament tn = Tournament.load(tournamendId);
        for (Team team : tn.getTeams()) {
    %>
    <tr>
        <td>
            <a href="javascript:teamView('<%=team.getId()%>')">
                <%=team.getName()%>
            </a>
        </td>
        <td><%=team.getCaptainName()%>
        </td>
        <td>
            <% if (session.getAttribute("admin") != null) { %>
            <a href="teamEdit.jsp?teamId=<%=team.getId()%>">
                <button type="button" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-pencil"></span>
                </button>
            </a>
            <% } %>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<% if (session.getAttribute("admin") != null) { %>
<a href="teamEdit.jsp">
    <button class="btn btn-danger">Créer</button>
</a>
<% } %>
<jsp:include page="footer.jsp"/>