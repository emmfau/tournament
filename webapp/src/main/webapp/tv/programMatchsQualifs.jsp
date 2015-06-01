<%@page import="fr.nacvolley.tournament.model.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%
  Tournament tn=null;
  if (session.getAttribute("tournamentId") != null) {
    String tournamendId = (String) session.getAttribute("tournamentId");
    tn = Tournament.load(tournamendId);
  }

  // Recherche du nombre de matchs maximum dans un groupe
  int maxNbMatchsInGroup = 0;
  for (Group group : tn.getQualifGroups()) {
    if (group.getMatchs().size() > maxNbMatchsInGroup) {
      maxNbMatchsInGroup = group.getMatchs().size();
    }
  }

  ArrayList<Match> matchsEnAttente=new ArrayList<Match>();
  ArrayList<Match> matchsEnCours=new ArrayList<Match>();
  ArrayList<Match> matchsTermines=new ArrayList<Match>();


  for (int matchIndex = 0; matchIndex < maxNbMatchsInGroup; matchIndex++) {
    for (Group group : tn.getQualifGroups()) {
      if (group.getMatchs().size() > matchIndex) {
        Match match = group.getMatchs().get(matchIndex);
        Team team1 = tn.searchTeam(match.getTeam1Id());
        Team team2 = tn.searchTeam(match.getTeam2Id());

        if (match.getState().equals(Match.WAIT) && matchsEnAttente.size()<3) {
          matchsEnAttente.add(match);
        }
        else if (match.getState().equals(Match.PLAY) && matchsEnCours.size()<3) {
          matchsEnCours.add(match);
        }
        else if (match.getState().equals(Match.END) && matchsTermines.size()<3) {
          matchsTermines.add(match);
        }

      }
    }
  }

%>
<section>
  <h2>L'actualité des matchs</h2>
</section>


<!-- test image vs -->
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

<!--
<section>
  <table>
    <tr>
      <td><img class="inactiveLeft" src="../uploads/14020770665211402163384782.jpg"/></td>
      <td>VS<br/><br/><br/></td>
      <td><img class="inactiveRight" src="../uploads/14020770665211402163384782.jpg"/></td>
    </tr>

    <tr>
      <td>Les trucs</td>
      <td></td>
      <td>Les machins</td>
    </tr>
  </table>
</section>
-->
<!--
<section>
  <table>
    <tr>
      <td colspan="3"><center>
        Prochain match<br>
      </center></td>
    </tr>
    <tr>
      <td class="inactiveLeft">
        <br>
        <img src="../uploads/14020770665211402163384782.jpg"/><br><br>
      </td>
      <td></td>
      <td class="inactiveRight">
        <br><img  src="../uploads/14020770665211402163384782.jpg"/>
        <br><br>
      </td>
    </tr>
    <tr>
      <td>Les trucs</td>
      <td><font color="#F89406">&nbsp;VS&nbsp;</font></td>
      <td>Les machins</td>
    </tr>
  </table>
</section>

-->


<%
  for (Match match:matchsTermines) {
    Team team1 = tn.searchTeam(match.getTeam1Id());
    Team team2 = tn.searchTeam(match.getTeam2Id());
%>
<section>
  <table>
    <tr>
      <td colspan="2"><center>
        <h2>Derniers matchs terminés</h2>
      </center></td>
    </tr>
    <tr>
      <td class="inactiveLeft">
        <br>
        <img src="../uploads/<%=team1.getPhoto()%>"/><br><br>
      </td>
      <td class="inactiveRight">
        <br><img  src="../uploads/<%=team2.getPhoto()%>"/>
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
        <h2>Matchs en cours</h2>
      </center></td>
    </tr>
    <tr>
      <td class="inactiveLeft">
        <br>
        <img src="../uploads/<%=team1.getPhoto()%>"/><br><br>
      </td>
      <td class="inactiveRight">
        <br><img  src="../uploads/<%=team2.getPhoto()%>"/>
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
        <h2>Prochains matchs</h2>
      </center></td>
    </tr>
    <tr>
      <td class="inactiveLeft">
        <br>
        <img src="../uploads/<%=team1.getPhoto()%>"/><br><br>
      </td>
      <td class="inactiveRight">
        <br><img  src="../uploads/<%=team2.getPhoto()%>"/>
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
