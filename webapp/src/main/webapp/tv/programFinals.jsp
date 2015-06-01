<%@page import="fr.nacvolley.tournament.model.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>

<%
  String tournamendId = (String) session.getAttribute("tournamentId");
  Tournament tn = Tournament.load(tournamendId);
  for (Group group : tn.getFinalGroups()) {
    // Recupération de la structure de tours pour affichage
    int nbTours = group.getFinalTours().size();
%>

  <%
    for (Tour tour : group.getFinalTours()) {

  %>
  <section>
         <h2> <%
           if (tn.getFinalGroups().indexOf(group) == 0) {
             out.print("<h2>PRINCIPALE</h2>");
           } else {
             out.print("<h2>CONSOLANTE</h2>");
           }
            int nieme = (int) Math.pow(2, nbTours - group.getFinalTours().indexOf(tour) - 1);
            if (nieme == 1) {
              out.println("<h3>Finale</h3>");
            } else if (nieme == 2) {
              out.println("<h3>Demi-finales</h3>");
            } else if (nieme == 4) {
              out.println("<h3>1/4 de finale</h3>");
            } else if (nieme > 4) {
              out.println("<h3>1/" + nieme + "ème de finale</h3>");
            }
          %>
         </h2>
  </section>


<section>
  <table>
    <thead>
    <th style="text-align:right">Equipe 1</th>
    <th style="text-align:center">/</th>
    <th style="text-align:left">Equipe 2</th>
    <!--<th>Etat</th>-->
    </thead>
    <tbody>
  <%
    for (Match match : tour.getMatchs()) {
      Team team1 = tn.searchTeam(match.getTeam1Id());
      Team team2 = tn.searchTeam(match.getTeam2Id());

  %>

  <tr>
    <td align="right">
      <%
        if (team1 != null) {
      %>
      <%=team1.getName()%>&nbsp;<font style="color:#0088CC"><%=match.getScore1()%></font>
      <%
        } else {
          out.print(" ");
        }
      %>
    </td>
    <td align="center">
      /
    </td>
    <td align="left">
      <%
        if (team2 != null) {
      %>
      <font style="color:#0088CC"><%=match.getScore2()%></font>&nbsp;<%=team2.getName()%>
      <%
        } else {
          out.print(" ");
        }
      %>
    </td>

    <!--
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
    -->

  </tr>

  <%
      }
  %>
    </tbody>
  </table>
</section>
<%
    }
  %>


<%

  }
%>