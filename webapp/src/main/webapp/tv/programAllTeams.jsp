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
  <h2>Les équipes</h2>
</section>
<%for (Team team : tn.getTeams()) {%>
<%
  String teamPhotoFileName = team.getPhoto();
  if (teamPhotoFileName == null || teamPhotoFileName.equals("")) {
    teamPhotoFileName="../images/background1.png";
  }
  else {
    teamPhotoFileName="../uploads/"+teamPhotoFileName;
  }

%>
<section data-background="<%=teamPhotoFileName%>" data-state="teamSectionState">
  <h3><%=team.getName()%></h3>
  <h5><%=team.getCaptainName()%> <%=team.getPlayersNames()%></h5>
</section>

<%}%>
