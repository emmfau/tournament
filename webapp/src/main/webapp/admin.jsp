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
    <p>Vous etes en mode administration. Des boutons rouges sont maintenant pr�sents dans les diff�rentes pages pour
        acc�der aux fonctionnalit�s avanc�es.</p>
    <a href="adminDisable.jsp">
        <button class="btn btn-danger">D�sactiver</button>
    </a>
    <% } %>
</div>

<% if (session.getAttribute("admin") != null) { %>
<h1>Fonctions sp�cifiques</h1>

<div class="row">
    <a href="qualifEdit.jsp">
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-pencil"></span>
            Qualifications : Param�trage
        </button>
    </a>
    <a href="qualifGroupsEdit.jsp">
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-asterisk"></span>
            Qualifications : cr�er groupes
        </button>
    </a>
    <a href="qualifMatchsCreate.jsp">
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-asterisk"></span>
            Qualifications : Cr�er matchs
        </button>
    </a>
    <br/>

</div>
<%
    }
%>

<jsp:include page="footer.jsp"/>
