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
  <h2>Les groupes de qualifications</h2>
</section>
<%
  for (Group group : tn.getQualifGroups()) {
%>
<section>
  <h2>Groupe <%=tn.getQualifGroups().indexOf(group) + 1%></h2>
  <h5><%=group.getTeamsIds().size()%> equipes</h5>
</section>
<%
  for (String teamId : group.getTeamsIds()) {
    Team team = tn.searchTeam(teamId);
    String teamPhotoFileName = team.getPhoto();
    if (teamPhotoFileName == null || teamPhotoFileName.equals("")) {
      teamPhotoFileName="../images/default.png";
    }
    else {
      teamPhotoFileName="../uploads/"+teamPhotoFileName;
    }
%>
<section data-background="<%=teamPhotoFileName%>" data-state="teamSectionState">
    <h5>Equipe du groupe <%=tn.getQualifGroups().indexOf(group) + 1%></h5>
    <h2><%=team.getName()%></h2>
</section>

<%}%>

<%
  }
%>








