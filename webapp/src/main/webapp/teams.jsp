<%@page import="fr.nacvolley.tournament.model.Team,fr.nacvolley.tournament.model.Tournament" %>
<jsp:include page="header.jsp"/>
<script>
    function teamView(id) {
        window.location.href = "teamView.jsp?teamId=" + encodeURIComponent(id);
    }

</script>

<h1>Equipes</h1>

<table class="table">

    <tbody>
    <%
        String tournamendId = (String) session.getAttribute("tournamentId");
        Tournament tn = Tournament.load(tournamendId);
        for (Team team : tn.getTeams()) {
    %>
    <tr>
        <td align="center">
            <%
                String teamPhotoFileName = team.getPhoto();
                if (teamPhotoFileName != null && !teamPhotoFileName.equals("")) {
            %>
            <a href="uploads/<%=teamPhotoFileName%>"><img src="uploads/<%=teamPhotoFileName%>-thumb.jpg"/></a>
            <% } else { %>
            <a href="images/team.jpg"><img src="images/team-thumb.jpg"/></a>
            <% } %>
            <br/>

            <h3><a href="javascript:teamView('<%=team.getId()%>')"><%=team.getName()%>
            </a></h3>
        </td>
        <td>
            <h5>
                <strong><span class="glyphicon glyphicon-user"></span> <%=team.getCaptainName()%>
                </strong><br/>
                &nbsp;&nbsp;&nbsp;+&nbsp;<%=team.getPlayersNames()%><br/><br/>
                <span class="glyphicon glyphicon-map-marker"></span> <%=team.getClub()%><br/><br/>
                <a href="tel:<%=team.getPhone()%>"><span
                        class="glyphicon glyphicon-phone-alt"></span> <%=team.getPhone()%>
                </a><br/>
            </h5>
        </td>
        <td>
            <% if (session.getAttribute("admin") != null) { %>
            <a href="teamEdit.jsp?teamId=<%=team.getId()%>">
                <button type="button" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-pencil"></span>
                </button>
            </a>
            <br/><br/>
            <a href="photoUpload.jsp?teamId=<%=team.getId()%>">
                <button type="button" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-camera"></span>
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
