<%@page import="fr.nacvolley.tournament.model.Team,fr.nacvolley.tournament.model.Tournament" %>
<jsp:include page="header.jsp"/>

<h1>Gestion des groupes de qualification</h1>

<a href="qualifGroupsEdit.jsp">
    <button class="btn btn-danger">Recréer des nouveaux groupes</button>
</a>
<br/>

<div class="alert alert-info alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <strong>Info</strong> Le tableau ci-dessous est recréé à chaque chargement de page en fonction des paramètres. Il
    est possible d'ajuster la sélection des groupes pour chaque équipe. Les groupes sont réellement enregistrés
    uniquement avec le bouton Enregistrer.
</div>


<table class="table">

    <thead>
    <th>Groupe identifié</th>
    <th>Equipe</th>
    <th>Niveau</th>
    </thead>
    <tbody>

    <%
        String tournamendId = (String) session.getAttribute("tournamentId");
        Tournament tn = Tournament.load(tournamendId);
        // ou une liste des équipes, avec les préférences de poule ?
        // un bouton de création aléatoire
        // un bouton de suppression des poules.
        for (Team team : tn.getTeams()) {
    %>
    <tr>
        <td>
            <input type="text" name="team324pref" class="form-control"/>
        </td>
        <td>
            <%=team.getName()%>
        </td>
        <td>
            <%=team.getLevel()%>
        </td>

    </tr>


    <%
        }
    %>
    </tbody>
</table>

<jsp:include page="footer.jsp"/>
