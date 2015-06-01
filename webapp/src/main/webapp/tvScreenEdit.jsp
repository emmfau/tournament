<%@page import="fr.nacvolley.tournament.model.*" %>
<%@ page import="fr.nacvolley.tournament.util.Randomizer" %>
<jsp:include page="header.jsp"/>

<%

  String tournamendId = (String) session.getAttribute("tournamentId");
  String screenId = (String) request.getParameter("screenId");
  Tournament tn = Tournament.load(tournamendId);
  boolean isNew = false;
  TvScreen screen;
  if (screenId != null) {
    screen = tn.getTv().searchTvScreen(screenId);
  } else {
    screen = new TvScreen();
    isNew = true;
  }

%>

<% if (!isNew) { %>
<script>
  function screenRemove(id) {
    if (confirm("Confirmez-vous la suppression ?")) {
      window.location.href = "tvScreenRemove.jsp?screenId=" + encodeURIComponent(id);
    }
  }
</script>
<% } %>

<div class="row">
  <h1>Ecran</h1>

  <form name="tvScreenUpdateForm" action="tvScreenUpdate.jsp" method="post" role="form">
    <input type="hidden" name="screenId" value="<%=screen.getId()%>"/>
    <% if (isNew) { %>
    <input type="hidden" name="isNew" value="true"/>
    <% } %>
    <div class="form-group">
      <label for="htmlContent">Contenu HTML</label>
      <textarea name="htmlContent" class="form-control"><%=screen.getHtmlContent()%></textarea>
    </div>
    <div class="form-group">
      <label for="background">Couleur fond</label>
      <i>bleu fonçé = #0044CC ; bleu clair = #0088CC ; vert = #51A351 ; orange = #F89406 ; red = #BD362F</i>
      <input type="text" name="background" class="form-control" value="<%=screen.getBackground()%>"/>

    </div>
    <div class="form-group">
      <label for="photo">Photo fond</label>
      <input type="text" name="photo" class="form-control" value="<%=screen.getPhoto()%>"/>
    </div>
    <div class="form-group">
      <label for="linkedPhase">Phase</label>
      <select name="linkedPhase" class="form-control">
        <option <%if (screen.getLinkedPhase()==0) { %> selected <% }%> value="<%=0%>">Toutes les phases</option>
        <option <%if (screen.getLinkedPhase()==Tournament.PHASE_OPENING) { %> selected <% }%> value="<%=Tournament.PHASE_OPENING%>">1 - Ouverture du tournoi</option>
        <option <%if (screen.getLinkedPhase()==Tournament.PHASE_PREPARING_QUALIFS) { %> selected <% }%> value="<%=Tournament.PHASE_PREPARING_QUALIFS%>">2 - Préparation des qualifications</option>
        <option <%if (screen.getLinkedPhase()==Tournament.PHASE_PLAYING_QUALIFS) { %> selected <% }%> value="<%=Tournament.PHASE_PLAYING_QUALIFS%>">3 - Qualifications</option>
        <option <%if (screen.getLinkedPhase()==Tournament.PHASE_PREPARING_FINALS) { %> selected <% }%> value="<%=Tournament.PHASE_PREPARING_FINALS%>">4 - Préparation des finales</option>
        <option <%if (screen.getLinkedPhase()==Tournament.PHASE_PLAYING_FINALS) { %> selected <% }%> value="<%=Tournament.PHASE_PLAYING_FINALS%>">5 - Finales</option>
        <option <%if (screen.getLinkedPhase()==Tournament.PHASE_ENDING) { %> selected <% }%> value="<%=Tournament.PHASE_ENDING%>">6 - Cloture du tournoi</option>
      </select>
     </div>
    <button type="submit" class="btn btn-danger">Enregistrer</button>
  </form><br/>
  <% if (!isNew) { %>
  <a href="javascript:screenRemove('<%=screen.getId()%>')">
    <button class="btn btn-danger">Supprimer</button>
  </a>
  <% } %>

</div>
<br/>
<jsp:include page="footer.jsp"/>
