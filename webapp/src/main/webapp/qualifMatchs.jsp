<%@page import="fr.nacvolley.tournament.model.Group,fr.nacvolley.tournament.model.Match" %>
<%@ page import="fr.nacvolley.tournament.model.Team" %>
<%@ page import="fr.nacvolley.tournament.model.Tournament" %>
<jsp:include page="header.jsp"/>
<h1>
    Qualification : matchs
</h1>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);
%>


<table class="table table-striped table-condensed">
    <thead>
    <th>Groupe</th>
    <th style="text-align:right">Equipe 1</th>
    <th style="text-align:center">/</th>
    <th style="text-align:left">Equipe 2</th>

    <th>Etat</th>

    </thead>
    <tbody>
    <%
        // Constitution de la liste des matchs ( dans l'ordre des groupes, puis dans l'ordre des matchs)
        //List<Match> matchs = new ArrayList<Match>();
        // Get 1st group matchs size
        /*
        int groupMatchsSize = 0; //default
        if (tn.getQualifGroups() != null) {
            groupMatchsSize = tn.getQualifGroups().size();
        }
        //for (Group group : tn.getQualifGroups()) { // old bad way to parse collections
        //for (Match match: group.getMatchs()) {
        for (int curMatchIdx = 0; curMatchIdx < groupMatchsSize; curMatchIdx++) {
            for (Group group : tn.getQualifGroups()) {
                Match match = group.getMatchs().get(curMatchIdx);
                Team team1 = tn.searchTeam(match.getTeam1Id());
                Team team2 = tn.searchTeam(match.getTeam2Id());
        */

        // Recherche du nombre de matchs maximum dans un groupe
        int maxNbMatchsInGroup = 0;
        for (Group group : tn.getQualifGroups()) {
            if (group.getMatchs().size() > maxNbMatchsInGroup) {
                maxNbMatchsInGroup = group.getMatchs().size();
            }
        }

        for (int matchIndex = 0; matchIndex < maxNbMatchsInGroup; matchIndex++) {
            for (Group group : tn.getQualifGroups()) {
                if (group.getMatchs().size() > matchIndex) {
                    Match match = group.getMatchs().get(matchIndex);
                    Team team1 = tn.searchTeam(match.getTeam1Id());
                    Team team2 = tn.searchTeam(match.getTeam2Id());
    %>
    <tr>
        <td>
            <span class="label label-success">Groupe <%=tn.getQualifGroups().indexOf(group) + 1%></span>

        </td>
        <td align="right">
            <%
                String style1 = null;
                String style2 = null;
                if (match.getScore1() > match.getScore2()) {
                    style1 = "label-info";
                    style2 = "label-default";
                } else if (match.getScore1() < match.getScore2()) {
                    style1 = "label-default";
                    style2 = "label-info";
                } else {
                    style1 = "label-default";
                    style2 = "label-default";
                }
            %>
            <%=team1.getName()%> <span class="label <%=style1%>"><%=match.getScore1()%></span>
        </td>
        <td align="center">
            /
        </td>
        <td align="left">
            <span class="label <%=style2%>"><%=match.getScore2()%></span> <%=team2.getName()%>
        </td>

        <td>
            <%
                if (match.getState().equals(Match.WAIT)) {
            %>
            <span class="label label-default">En attente</span>
            <%
            } else if (match.getState().equals(Match.PLAY)) {
            %>
            <span class="label label-warning">En cours [T<%=match.getField()%>]</span>
            <%
            } else if (match.getState().equals(Match.END)) {
            %>
            <span class="label label-info">Terminé</span>
            <%
                }
            %>

        </td>
        <td>
            <% if (session.getAttribute("admin") != null) { %>
            <a href="qualifMatchEdit.jsp?matchId=<%=match.getId()%>">
                <button type="button" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-pencil"></span>
                </button>
            </a>
            <% } %>
        </td>


    </tr>
    <%
                }

            }

        }

    %>
    </tbody>

</table>


<jsp:include page="footer.jsp"/>
