<jsp:include page="header.jsp"/>

<h1>Activation du mode administration</h1>

<div class="row">

    <% if (session.getAttribute("admin") == null) { %>

    <form action="adminAction.jsp" method="post" role="form">
        <div class="form-group">
            <label for="password">Mot de passe</label>
            <input type="password" name="password" class="form-control"/>
        </div>
        <button type="submit" class="btn btn-primary">Activer</button>
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
    <p>Vous etes en mode administration. Des boutons rouges sont maintenant présents dans les différentes pages pour
        accéder aux fonctionnalités avancées.</p>
    <a href="adminDisable.jsp">
        <button class="btn btn-danger">Désactiver</button>
    </a>
    <% } %>
</div>

<jsp:include page="footer.jsp"/>
