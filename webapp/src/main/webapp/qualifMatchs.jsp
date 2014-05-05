<%@page import="fr.nacvolley.tournament.model.Group,fr.nacvolley.tournament.model.Match" %>
<%@ page import="fr.nacvolley.tournament.model.Tournament" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<jsp:include page="header.jsp"/>
<h1>
    Qualification : matchs
    <% if (session.getAttribute("admin") != null) { %>
    <br/>
    <a href="qualifMatchsEdit.jsp">
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-asterisk"></span>
            Créer matchs
        </button>
    </a>
    <% } %>
</h1>
<%

    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);
    // Constitution de la liste des matchs ( dans l'ordre des groupes, puis dans l'ordre des matchs)
    List<Match> matchs = new ArrayList<Match>();
    for (Group group : tn.getQualifGroups()) {


    }
%>


<table class="table table-striped table-condensed">
    <thead>
    <th>Match</th>
    <th>Heure</th>
    <th>Terrain</th>
    </thead>
    <tbody>

    <tr>
        <td>

        </td>

    </tr>

    </tbody>

</table>


<jsp:include page="footer.jsp"/>