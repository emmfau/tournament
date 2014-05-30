<%@page import="fr.nacvolley.tournament.model.Tournament" %>
<jsp:include page="header.jsp"/>

<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);
%>

<h1> Paramètrage des groupes de qualification</h1>

<form name="qualifUpdateForm" action="qualifUpdate.jsp" method="post" role="form">

    <div class="form-group">Nombre de groupes de qualification
        <input type="text" name="qualifNbGroups" class="form-control" value="<%=tn.getQualifNbGroups()%>"/>
    </div>
    <!-- <div class="form-group">Nombre d'équipes par groupe
        <input type="text" name="qualifNbTeamsPerGroup" class="form-control"
               value="<%=tn.getQualifNbTeamsPerGroup()%>"/>
    </div>
    <div class="form-group">Nombre de terrains
        <input type="text" name="qualifNbGrounds" class="form-control" value="<%=tn.getQualifNbGrounds()%>"/>
    </div>
    -->
    <br/>

    <div class="form-group">Nombre de points pour une victoire
        <input type="text" name="qualifPointsForVictory" class="form-control"
               value="<%=tn.getQualifPointsForVictory()%>"/>
    </div>
    <div class="form-group">Nombre de points pour un nul
        <input type="text" name="qualifPointsForNull" class="form-control" value="<%=tn.getQualifPointsForNull()%>"/>
    </div>
    <div class="form-group">Nombre de points pour une défaite
        <input type="text" name="qualifPointsForDefeat" class="form-control"
               value="<%=tn.getQualifPointsForDefeat()%>"/>
    </div>
    <br/>
    <!--
    <div class="form-group">Heure du début des qualifications
        <input type="text" name="qualifStartTime" class="form-control" value="<%=tn.getQualifStartTime()%>"/>
    </div>
    <div class="form-group">Estimation de temps d'un match (en mn)
        <input type="text" name="qualifMatchTime" class="form-control" value="<%=tn.getQualifMatchTime()%>"/>
    </div>
    <div class="form-group">Estimation de temps entre deux matchs (en mn)
        <input type="text" name="qualifPauseTime" class="form-control" value="<%=tn.getQualifPauseTime()%>"/>
    </div>
    <br/>
    -->
    <button type="submit" class="btn btn-danger">Enregistrer</button>
</form>
<br/>

<jsp:include page="footer.jsp"/>
