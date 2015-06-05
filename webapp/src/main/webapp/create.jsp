<%@page import="fr.nacvolley.tournament.model.Tournament,java.text.SimpleDateFormat, java.util.List" %>
<jsp:include page="header.jsp"/>

<h1>Créer un nouveau tournoi</h1>

<form name="tournamendCreateForm" action="indexCreateAction.jsp" method="post" role="form">
  <div class="form-group">
    <label for="name">Nom du nouveau tournoi</label>
    <input type="text" name="name" class="form-control"/>
  </div>
  <div class="form-group">
    <label for="name">Nouveau mot de passe pour paramétrer ce tournoi</label>
    <input type="password" name="password" class="form-control"/>
  </div>
  <button type="submit" class="btn btn-danger">Créer</button>
</form>
<br/>

<jsp:include page="footer.jsp"/>
