<%@page import="fr.nacvolley.tournament.model.Group,fr.nacvolley.tournament.model.Match" %>
<%@ page import="fr.nacvolley.tournament.model.Tour" %>
<%@ page import="fr.nacvolley.tournament.model.Tournament" %>
<jsp:include page="header.jsp"/>

<script>
    function qualifsRemove() {
        if (confirm("Confirmez-vous la suppression ?")) {
            window.location.href = "qualifsRemove.jsp";
        }
    }
    function finalsRemove() {
        if (confirm("Confirmez-vous la suppression ?")) {
            window.location.href = "finalsRemove.jsp";
        }
    }
</script>

<h1>Paramètres du tournoi</h1>

<h2>Mode administration</h2>

<div class="row">

    <% if (session.getAttribute("admin") == null) { %>

    <form action="adminAction.jsp" method="post" role="form">
        <div class="form-group">
            <label for="password">Mot de passe</label>
            <input type="password" name="password" class="form-control"/>
        </div>
        <button type="submit" class="btn btn-primary">Activer le mode administration</button>
    </form>
    <%
        String adminError = request.getParameter("adminError");
        if (adminError != null) {
    %>
    <div class="alert alert-error alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>Erreur</strong> Mot de passe incorrect.
    </div>
    <%
        }
    %>
    <% } else { %>
    <p>Vous êtes actuellement en mode administration. Des boutons rouges sont présents dans les différentes pages pour
        accéder aux fonctionnalités avancées.</p>
    <a href="adminDisable.jsp">
        <button class="btn btn-danger">Désactiver le mode administration</button>
    </a>
    <% } %>
</div>

<% if (session.getAttribute("admin") != null) { %>

<h2>Fonctions générales</h2>

<div class="row">
    <a href="qualifEdit.jsp">
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-pencil"></span>
            Paramètres des qualifications et finales
        </button>
    </a>
</div>

<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);
%>

<h2>Fonctions spécifiques aux qualifications</h2>

<%
    int nbQualifsMatchsStarted = 0;
    for (Group group : tn.getQualifGroups()) {
        for (Match match : group.getMatchs()) {
            if (match.getScore1() > 0 || match.getScore2() > 0) {
                nbQualifsMatchsStarted++;
            }
        }
    }

    // Si aucun match de qualif n'a démarré
    if (nbQualifsMatchsStarted == 0) {
%>
<div class="row">
    <a href="qualifGroupsEdit.jsp">
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-asterisk"></span>
            (Re)créer les groupes
        </button>
    </a>
    <%

    %>
    <a href="qualifMatchsCreate.jsp">
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-asterisk"></span>
            (Re)créer les matchs
        </button>
    </a>

    <a href="javascript:qualifsRemove()">
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-asterisk"></span>
            Supprimer les groupes et les matchs
        </button>
    </a>
    <br/>
</div>
<%
} else {
%>
<div class="alert alert-warning alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <strong>Info</strong> Au moins un match de qualif a démarré : il n'est plus possible de recréer les groupes et
    matchs de qualif, ou de supprimer.
</div>
<%
    }
%>


<h2>Fonctions spécifiques aux finales</h2>

<%
    int nbFinalMatchsStarted = 0;
    for (Group group : tn.getFinalGroups()) {
        for (Tour tour : group.getFinalTours()) {
            for (Match match : tour.getMatchs()) {
                if (match.getScore1() > 0 || match.getScore2() > 0) {
                    nbFinalMatchsStarted++;
                }
            }
        }
    }

    // Si aucun match de final n'a démarré
    if (nbFinalMatchsStarted == 0) {
%>

<div class="row">
    <a href="finalMatchsCreate.jsp">
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-pencil"></span>
            (Re)créer les groupes et les matchs
        </button>
    </a>
    <a href="javascript:finalsRemove()">
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-asterisk"></span>
            Supprimer les groupes et les matchs
        </button>
    </a>
</div>


<%
} else {
%>
<div class="alert alert-warning alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <strong>Info</strong> Au moins un match de finale a démarré : il n'est plus possible de recréer les groupes et
    matchs de finale, ou de supprimer.
</div>
<%
    }
%>


<%
    }
%>

<jsp:include page="footer.jsp"/>
