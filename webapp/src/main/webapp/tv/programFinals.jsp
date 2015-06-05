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

           String context="";

           if (tn.getFinalGroups().indexOf(group) == 0) {
             out.print("<h2>PRINCIPALE</h2>");
             context="PRINCIPALE -";
           } else {
             out.print("<h2>CONSOLANTE</h2>");
             context="CONSOLANTE -";
           }
            int nieme = (int) Math.pow(2, nbTours - group.getFinalTours().indexOf(tour) - 1);
            if (nieme == 1) {
              out.println("<h3>Finale</h3>");
              context+=" Finale";
            } else if (nieme == 2) {
              out.println("<h3>Demi-finales</h3>");
              context+=" Demi-finales";
            } else if (nieme == 4) {
              out.println("<h3>1/4 de finale</h3>");
              context+=" 1/4 de finale";
            } else if (nieme > 4) {
              out.println("<h3>1/" + nieme + "ème de finale</h3>");
              context+=" 1/" + nieme + "ème de finale";
            }
          %>
         </h2>
  </section>




<style>
  .cbImage {
    width: 200px;
    height: 268px;
    float: left;
    margin: 25px 0px 25px 0px;
    color: white;
    box-shadow: 0px 5px 10px 0px #D6D6D6;
    position: absolute;
    -webkit-transform-style: preserve-3d;
    transform-style: preserve-3d;
  }

  .inactiveLeft {
    -webkit-transform: perspective(100px) rotateY(5deg);
    -O-transform: perspective(100px) rotateY(5deg);
    transform: perspective(100px) rotateY(5deg);
  }
  .inactiveRight {
    -webkit-transform: perspective(100px) rotateY(-5deg);
    -O-transform: perspective(100px) rotateY(-5deg);
    transform: perspective(100px) rotateY(-5deg);
  }
</style>

<!-- AJOUT DES MATCHS EN COURS, etc..) -->

<%


  ArrayList<Match> matchsEnAttente=new ArrayList<Match>();
  ArrayList<Match> matchsEnCours=new ArrayList<Match>();
  ArrayList<Match> matchsTermines=new ArrayList<Match>();

  for (Match match : tour.getMatchs()) {
    Team team1 = tn.searchTeam(match.getTeam1Id());
    Team team2 = tn.searchTeam(match.getTeam2Id());
    if (team1!=null && team2!=null) { // on prend que les matchs à 2 équipes réelles
      if (match.getState().equals(Match.WAIT) && matchsEnAttente.size() < 3) {
        matchsEnAttente.add(match);
      } else if (match.getState().equals(Match.PLAY)) {
        matchsEnCours.add(match);
      } else if (match.getState().equals(Match.END)) {
        matchsTermines.add(match);
      }
    }
    // A la fin NE PRENDRE QUE LES 3 DERNIERS TERMINES
    if (matchsTermines.size()>=3) {
      ArrayList<Match> mt=new ArrayList<Match>();
      mt.add(matchsTermines.get(matchsTermines.size()-3));
      mt.add(matchsTermines.get(matchsTermines.size()-2));
      mt.add(matchsTermines.get(matchsTermines.size()-1));
      matchsTermines=mt;
    }

  }
%>

<%
  for (Match match:matchsTermines) {
    Team team1 = tn.searchTeam(match.getTeam1Id());
    Team team2 = tn.searchTeam(match.getTeam2Id());
    // Il peut y avoir des équipes à null en éliminatoires => dans ce cas les équipes passent direct.
    if (team1==null) {
      team1=new Team();
    }
    if (team2==null) {
      team2=new Team();
    }
%>
<section>
  <table>
    <tr>
      <td colspan="2"><center>
        <h5><%=context%><br>Derniers matchs terminés</h5>
      </center></td>
    </tr>
    <tr>
      <td class="inactiveLeft">
        <br>
        <img  width="1000px" src="../uploads/<%=team1.getPhoto()%>"/><br><br>
      </td>
      <td class="inactiveRight">
        <br><img  width="1000px"  src="../uploads/<%=team2.getPhoto()%>"/>
        <br><br>
      </td>
    </tr>
    <tr>
      <td colspan="2"><center>
        <b><font color="#0088CC"><%=match.getScore1()%></font></b> <%=team1.getName()%>
        <font color="#F89406">&nbsp;VS&nbsp;</font>
        <%=team2.getName()%> <b><font color="#0088CC"><%=match.getScore2()%></font></b>
      </center></td>
    </tr>

  </table>
</section>
<% } %>


<%
  for (Match match:matchsEnCours) {
    Team team1 = tn.searchTeam(match.getTeam1Id());
    Team team2 = tn.searchTeam(match.getTeam2Id());
%>
<section>
  <table>
    <tr>
      <td colspan="2"><center>
        <h5><%=context%><br>Matchs en cours</h5>
      </center></td>
    </tr>
    <tr>
      <td class="inactiveLeft">
        <br>
        <img width="1000px"  src="../uploads/<%=team1.getPhoto()%>"/><br><br>
      </td>
      <td class="inactiveRight">
        <br><img  width="1000px"  src="../uploads/<%=team2.getPhoto()%>"/>
        <br><br>
      </td>
    </tr>
    <tr>
      <td colspan="2"><center>
        <%=team1.getName()%>
        <font color="#F89406">&nbsp;VS&nbsp;</font>
        <%=team2.getName()%>
        <br><font color="#F89406">Terrain&nbsp;<%=match.getField()%></font>
      </center></td>
    </tr>

  </table>
</section>
<% } %>


<%
  for (Match match:matchsEnAttente) {
    Team team1 = tn.searchTeam(match.getTeam1Id());
    Team team2 = tn.searchTeam(match.getTeam2Id());
%>
<section>
  <table>
    <tr>
      <td colspan="2"><center>
        <h5><%=context%><br>Prochains matchs</h5>
      </center></td>
    </tr>
    <tr>
      <td class="inactiveLeft">
        <br>
        <img width="1000px"  src="../uploads/<%=team1.getPhoto()%>"/><br><br>
      </td>
      <td class="inactiveRight">
        <br><img  width="1000px"  src="../uploads/<%=team2.getPhoto()%>"/>
        <br><br>
      </td>
    </tr>
    <tr>
      <td colspan="2"><center>
        <%=team1.getName()%>
        <font color="#F89406">&nbsp;VS&nbsp;</font>
        <%=team2.getName()%>
      </center></td>
    </tr>

  </table>
</section>
<% } %>

<!-- fin matchs en cours -->




<section>
  <h5><%=context%></h5>
  <table>

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
      <%=team1.getName()%>&nbsp;
        <%
          if (team2!=null) {
        %>
          <font style="color:#0088CC"><%=match.getScore1()%></font>
        <%
          }
        %>
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
      <%
        if (team1!=null) {
      %>
      <font style="color:#0088CC"><%=match.getScore2()%></font>
      <%
        }
      %>
      &nbsp;<%=team2.getName()%>
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