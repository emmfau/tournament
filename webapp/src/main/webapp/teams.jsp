<%@page import="fr.nacvolley.tournament.model.Team,fr.nacvolley.tournament.model.Tournament" %>
<jsp:include page="header.jsp"/>
<script>
    function teamView(id) {
        window.location.href = "teamView.jsp?teamId=" + encodeURIComponent(id);
    }

</script>

<h1>
    Equipes

</h1>

<table class="table table-striped">

    <tbody>
    <%
        String tournamendId = (String) session.getAttribute("tournamentId");
        Tournament tn = Tournament.load(tournamendId);
        for (Team team : tn.getTeams()) {
    %>
    <tr>
        <td>
            <h3><span class="label label-info"><%=tn.getTeams().indexOf(team) + 1%></span></h3>
        </td>
        <td>
            <%
                String teamPhotoFileName = team.getPhoto();
                if (teamPhotoFileName != null && !teamPhotoFileName.equals("")) {
            %>
            <a href="uploads/<%=teamPhotoFileName%>"><img src="uploads/<%=teamPhotoFileName%>-thumb.jpg"/></a>
            <% } else { %>
            <a href="images/team.jpg"><img src="images/team-thumb.jpg"/></a>
            <% } %>
        </td>
        <td>
            <h3><a href="javascript:teamView('<%=team.getId()%>')"><%=team.getName()%>
            </a></h3>
            <h5>
                <strong><span class="glyphicon glyphicon-user"></span> <%=team.getCaptainName()%>
                </strong> + <%=team.getPlayersNames()%><br/>
                <span class="glyphicon glyphicon-map-marker"></span> <%=team.getClub()%><br/>
                <a href="tel:<%=team.getPhone()%>"><span>
                        <span class="glyphicon glyphicon-phone-alt"></span> <%=team.getPhone()%>
                </a>
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
    <button class="btn btn-danger">Cr�er</button>
</a>

<a href="#teamCreated"><br/><br/></a>

<a href="teamCreateRandom.jsp">
    <button type="button" class="btn btn-danger">Cr�er une �quipe al�atoire</button>
</a>
<br/><br/>
<% } %>

<jsp:include page="footer.jsp"/>
