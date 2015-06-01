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
%>
<section>
  <h2>Résultats définitifs des qualifications</h2>
</section>
<%
  for (Group group : tn.getQualifGroups()) {
%>
<section>

  <h2>Groupe <%=tn.getQualifGroups().indexOf(group) + 1%></h2>
  <table>
    <thead>
    <tr>
      <th> </th>
      <th><font style="color:#51A351"><b>PTS</b></font></th>
      <th>MJ</th>
      <th>MG</th>
      <th>MN</th>
      <th>MP</th>
      <th><font style="color:#0088CC">P+</font></th>
      <th><font style="color:#0088CC">P-</font></th>
      <th><font style="color:#0088CC">D</font></th>
    </tr>
    </thead>

    <tbody>
    <%
      // Récupérer les équipes et calculer leurs points
      List<Team> teams = new ArrayList<Team>();

      List<Team> orderedTeams = new ArrayList<Team>();


      for (String teamId : group.getTeamsIds()) {
        Team team = tn.searchTeam(teamId);
        team.setTeamPoints(group.computeTeamPoints(teamId, tn.getQualifPointsForVictory(), tn.getQualifPointsForNull(), tn.getQualifPointsForDefeat()));
        teams.add(team);
      }

      // Trier les équipes selon leurs points
      Collections.sort(teams, Group.qualifGroupComparator);

      for (Team team : teams) {
    %>
    <tr>
      <td>
        <%=team.getName()%>
      </td>
      <td class="success"><font style="color:#51A351"><strong><b><%=team.getTeamPoints().points%></b>
      </strong></font></td>
      <td><%=team.getTeamPoints().matchsPlayed%>
      </td>
      <td><%=team.getTeamPoints().matchsWon%>
      </td>
      <td><%=team.getTeamPoints().matchsNul%>
      </td>
      <td><%=team.getTeamPoints().matchsLost%>
      </td>
      <td class="info">
        <font style="color:#0088CC"><%=team.getTeamPoints().pointsWon%></font>
      </td>
      <td class="info">
        <font style="color:#0088CC"><%=team.getTeamPoints().pointsLost%></font>
      </td>
      <td class="info">
        <font style="color:#0088CC"><%=team.getTeamPoints().pointsDiff%></font>
      </td>
    </tr>


    <%
      }
    %>
    </tbody>


  </table>

</section>

<%
  for (Team team : teams) {
%>
<section data-background="../uploads/<%=team.getPhoto()%>">
  <h2>Groupe <%=tn.getQualifGroups().indexOf(group) + 1%></h2>
  <h3>Place n°<%=teams.indexOf(team) + 1%></h3>
  <h3><%=team.getName()%></h3>
</section>
<%
  }
%>


<%}%>

