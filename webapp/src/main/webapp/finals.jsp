<%@page import="fr.nacvolley.tournament.model.Group,fr.nacvolley.tournament.model.Tournament" %>
<jsp:include page="header.jsp"/>


<h1>
    Qualifications : finales
</h1>

<table class="table table-striped table-condensed">
    <thead>

    </thead>
    <tbody>
    <%
        String tournamendId = (String) session.getAttribute("tournamentId");
        Tournament tn = Tournament.load(tournamendId);
        for (Group group : tn.getFinalGroups()) {
    %>
    <tr>

    </tr>

    <%
        }
    %>
    </tbody>
</table>


<% if (tn.getFinalGroups().size() == 0) { %>
<div class="alert alert-warning alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <strong>Info</strong> Aucun groupe de finale n'est créé pour le moment.
</div>
<% } %>

<jsp:include page="footer.jsp"/>