<jsp:include page="header.jsp"/>

<div class="jumbotron">
    <h3>Aide / Guide d'utilisation</h3>
    <h4>
        <ul>
            <li>Activer le mode administration à l'aide du mot de passe du tournoi (si vous venez de créer un nouveau
                tournoi, vous êtes automatiquement en mode administration).
            </li>
            <li>Dans la page Equipes, créer les différentes équipes qui participeront</li>
            <li>Une fois toutes les équipes prêtes : dans les paramètres, vérifiez les paramètres des qualifications
            </li>
            <li>Dans les paramètres, créer/recréer les groupes de qualifications (les ventilations des équipes sont en
                fonction du niveau saisi dans la création d'une équipe, avec un peu de hasard)
            </li>
            <li>Une fois les groupes de qualifs prêts, créer/recréer les matchs de qualifications</li>
            <li>Lancez les matchs ! Modifiez les matchs de qualifs au fur et à mesure, et consultez les résultats dans
                la page groupes de qualifs
            </li>
            <li>Une fois les qualifs terminées, créer/recréer les groupes et matchs de finales</li>
            <li>Lancez les matchs ! Modifiez les matchs de finales au fur et à mesure, et consultez les résultats dans
                la page finales
            </li>
            <li>Une fois les finales terminées, .. bah c'est fini :)</li>
        </ul>
    </h4>
</div>

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


<h2>Fonctions spécifiques aux qualifications</h2>

<div class="row">
    <a href="qualifEdit.jsp">
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-pencil"></span>
            Paramètres
        </button>
    </a>
    <a href="qualifGroupsEdit.jsp">
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-asterisk"></span>
            (Re)créer les groupes
        </button>
    </a>
    <a href="qualifMatchsCreate.jsp">
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-asterisk"></span>
            (Re)créer les matchs
        </button>
    </a>
    <br/>

</div>

<h2>Fonctions spécifiques aux finales</h2>

<div class="row">
    <a href="finalMatchsCreate.jsp">
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-pencil"></span>
            (Re)créer les groupes et les matchs
        </button>
    </a>
</div>


<%
    }
%>

<jsp:include page="footer.jsp"/>
