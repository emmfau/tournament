<%@page import="fr.nacvolley.tournament.model.*" %>

<jsp:include page="header.jsp"/>

<h1>Finales</h1>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);
    for (Group group : tn.getFinalGroups()) {
        // Recupération de la structure de tours pour affichage
        int nbTours = group.getFinalTours().size();
%>
<br/>

<h1>
    <span class="label label-success">
    <%
        if (tn.getFinalGroups().indexOf(group) == 0) {
            out.print("Principale");
        } else {
            out.print("Consolante");
        }
    %>
    </span>
</h1>

<table class="table table-striped table-condensed">
    <thead>
    <th style="text-align:right">Equipe 1</th>
    <th style="text-align:center">/</th>
    <th style="text-align:left">Equipe 2</th>

    <th>Etat</th>
    </thead>
    <tbody>

    <%
        for (Tour tour : group.getFinalTours()) {

    %>
    <tr>
        <td>
            <h4>
                <%
                    int nieme = (int) Math.pow(2, nbTours - group.getFinalTours().indexOf(tour) - 1);
                    if (nieme == 1) {
                        out.println("Finale");
                    } else if (nieme == 2) {
                        out.println("Demi-finales");
                    } else if (nieme == 4) {
                        out.println("1/4 de finale");
                    } else if (nieme > 4) {
                        out.println("1/" + nieme + "ème de finale");
                    }
                %>
            </h4>
        </td>
    </tr>

    <%
        for (Match match : tour.getMatchs()) {
            Team team1 = tn.searchTeam(match.getTeam1Id());
            Team team2 = tn.searchTeam(match.getTeam2Id());

    %>

    <tr>
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
            <% if (team1 != null) {
            %>
            <a href="teamView.jsp?teamId=<%=team1.getId()%>"><%=team1.getName()%>
            </a>
            <%
            } else {
                out.print("--------");
            }
            %>
            <span class="label <%=style1%>"><%=match.getScore1()%></span>
        </td>
        <td align="center">
            /
        </td>
        <td align="left">
            <span class="label <%=style2%>"><%=match.getScore2()%></span>
            <% if (team2 != null) {
            %>
            <a href="teamView.jsp?teamId=<%=team2.getId()%>"><%=team2.getName()%>
            </a>
            <%
            } else {
                out.print("--------");
            }
            %>

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
            <a href="finalMatchEdit.jsp?matchId=<%=match.getId()%>">
                <button type="button" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-pencil"></span>
                </button>
            </a>
            <% } %>
        </td>
    </tr>

    <%
        }
        }
    %>
    </tbody>
</table>

<%

    }
%>
<br/>
<br/>
<br/>


<% if (tn.getFinalGroups().size() == 0) { %>
<div class="alert alert-warning alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <strong>Info</strong> Aucun groupe de finale n'est créé pour le moment.
</div>
<% } %>

<jsp:include page="footer.jsp"/>