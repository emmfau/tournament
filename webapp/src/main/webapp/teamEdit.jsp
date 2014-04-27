<%@page import="fr.nacvolley.tournament.model.Team,fr.nacvolley.tournament.model.Tournament" %>
<jsp:include page="header.jsp"/>

<%

    String tournamendId = (String) session.getAttribute("tournamentId");
    String teamId = (String) request.getParameter("teamId");
    Tournament tn = Tournament.load(tournamendId);
    boolean isNew = false;
    Team team;
    if (teamId != null) {
        team = tn.searchTeam(teamId);
    } else {
        team = new Team();
        isNew = true;
    }

%>

<% if (!isNew) { %>
<script>
    function teamRemove(id) {
        if (confirm("Confirmez-vous la suppression ?")) {
            window.location.href = "teamRemove.jsp?teamId=" + encodeURIComponent(id);
        }
    }
</script>
<% } %>

<div class="row">
    <h1><%=team.getName()%>
    </h1>

    <form name="teamUpdateForm" action="teamUpdate.jsp" method="post" role="form">
        <input type="hidden" name="teamId" value="<%=team.getId()%>"/>
        <% if (isNew) { %>
        <input type="hidden" name="isNew" value="true"/>
        <% } %>
        <div class="form-group">
            <label for="name">Nom</label>
            <input type="text" name="name" class="form-control" value="<%=team.getName()%>"/>
        </div>
        <div class="form-group">
            <label for="captainName">Prénom nom du capitaine</label>
            <input type="text" name="captainName" class="form-control" value="<%=team.getCaptainName()%>"/>
        </div>
        <div class="form-group">
            <label for="playersName">Prénoms noms des joueurs</label>
            <input type="text" name="playersName" class="form-control" value="<%=team.getPlayersNames()%>"/>
        </div>
        <div class="form-group">
            <label for="club">Club</label>
            <input type="text" name="club" class="form-control" value="<%=team.getClub()%>"/>
        </div>
        <div class="form-group">
            <label for="comments">Commentaires</label>
            <input type="text" name="comments" class="form-control" value="<%=team.getComments()%>"/>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="text" name="email" class="form-control" value="<%=team.getEmail()%>"/>
        </div>
        <div class="form-group">
            <label for="level">Niveau de jeu ( 1 = amateur, 10 = pro )</label>
            <input type="text" name="level" class="form-control" value="<%=team.getLevel()%>"/>
        </div>
        <div class="form-group">
            <label for="phone">Téléphone</label>
            <input type="text" name="phone" class="form-control" value="<%=team.getPhone()%>"/>
        </div>
        <div class="form-group">
            <label for="photo">Photo</label>
            <input type="text" name="photo" class="form-control" value="<%=team.getPhoto()%>"/>
        </div>
        <div class="form-group">
            <label for="state">Etat</label>
            <input type="text" name="state" class="form-control" value="<%=team.getState()%>"/>
        </div>
        <button type="submit" class="btn btn-danger">Enregistrer</button>
    </form>
    <% if (!isNew) { %>
    <a href="javascript:teamRemove('<%=team.getId()%>')">
        <button class="btn btn-danger">Supprimer</button>
    </a>
    <% } %>


</div>
<br/>
<jsp:include page="footer.jsp"/>
