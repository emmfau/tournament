<jsp:include page="header.jsp"/>

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
