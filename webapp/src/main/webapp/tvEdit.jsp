<%@page import="fr.nacvolley.tournament.model.*" %>
<%@ page import="java.util.List" %>
<jsp:include page="header.jsp"/>

<%
    String tournamentId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamentId);
%>

<h1> Paramètres de la TV</h1>

<h2> Paramètres de la chaine TV</h2>
<form name="tvUpdateForm" action="tvUpdate.jsp" method="post" role="form">

    <div class="form-group">Phase du tournoi
        <select name="phase" class="form-control">
            <option <%if (tn.getTv().getPhase()==Tournament.PHASE_OPENING) { %> selected <% }%> value="<%=Tournament.PHASE_OPENING%>">1 - Ouverture du tournoi</option>
            <option <%if (tn.getTv().getPhase()==Tournament.PHASE_PREPARING_QUALIFS) { %> selected <% }%> value="<%=Tournament.PHASE_PREPARING_QUALIFS%>">2 - Préparation des qualifications</option>
            <option <%if (tn.getTv().getPhase()==Tournament.PHASE_PLAYING_QUALIFS) { %> selected <% }%> value="<%=Tournament.PHASE_PLAYING_QUALIFS%>">3 - Qualifications</option>
            <option <%if (tn.getTv().getPhase()==Tournament.PHASE_PREPARING_FINALS) { %> selected <% }%> value="<%=Tournament.PHASE_PREPARING_FINALS%>">4 - Préparation des finales</option>
            <option <%if (tn.getTv().getPhase()==Tournament.PHASE_PLAYING_FINALS) { %> selected <% }%> value="<%=Tournament.PHASE_PLAYING_FINALS%>">5 - Finales</option>
            <option <%if (tn.getTv().getPhase()==Tournament.PHASE_ENDING) { %> selected <% }%> value="<%=Tournament.PHASE_ENDING%>">6 - Cloture du tournoi</option>
        </select>
    </div>
    <br/>
    <!--
    <div class="form-group">Nombre de points pour une victoire
        <input type="text" name="qualifPointsForVictory" class="form-control"
               value="<%=tn.getQualifPointsForVictory()%>"/>
    </div>
    <div class="form-group">Nombre de points pour un nul
        <input type="text" name="qualifPointsForNull" class="form-control" value="<%=tn.getQualifPointsForNull()%>"/>
    </div>
    <div class="form-group">Nombre de points pour une d?faite
        <input type="text" name="qualifPointsForDefeat" class="form-control"
               value="<%=tn.getQualifPointsForDefeat()%>"/>
    </div>
    <br/>

    <div class="form-group">Finales : Nombre d'?quipes prises pour la principale (ex : 2 pour prendre les 2 premi?res de
        chaque poule en principale)
        <input type="text" name="qualifTeamsInFinalPrincipal" class="form-control"
               value="<%=tn.getQualifTeamsInFinalPrincipal()%>"/>
    </div>
    <br/>
    -->
    <button type="submit" class="btn btn-danger">Enregistrer</button>
</form>
<br/>

<h2> Ecrans TV personnalisés</h2>

<table class="table table-striped">
    <thead>
        <tr>
            <td><h3>Contenu HTML</h3></td>
            <td><h3>Couleur fond</h3></td>
            <td><h3>Photo fond</h3></td>
            <td><h3>Phase</h3></td>
        </tr>
    </thead>
    <tbody>
    <%
        List<TvScreen> screens=tn.getTv().getScreens();
        for (TvScreen screen : screens) {
    %>

    <tr>
        <td>
            <h5><%=screen.getHtmlContent().replace("<", "&lt;").replace(">", "&gt;")%></h5>
        </td>
        <td>
            <h5><%=screen.getBackground()%></h5>
        </td>
        <td>
                <%
                    if (screen.getPhoto()!=null && !screen.getPhoto().equals("")) {
                %>
                    <a href="uploads/<%=screen.getPhoto()%>"><img src="uploads/<%=screen.getPhoto()%>-thumb.jpg"/></a>
                <%
                    }
                %>

        </td>
        <td>
            <%
                String phase=null;
                switch (screen.getLinkedPhase()) {
                    case Tournament.PHASE_OPENING:
                        phase="1 - Ouverture du tournoi";
                        break;
                    case Tournament.PHASE_PREPARING_QUALIFS:
                        phase="2 - Préparation des qualifications";
                        break;
                    case Tournament.PHASE_PLAYING_QUALIFS:
                        phase="3 - Qualifications";
                        break;
                    case Tournament.PHASE_PREPARING_FINALS:
                        phase="4 - Préparation des finales";
                        break;
                    case Tournament.PHASE_PLAYING_FINALS:
                        phase="5 - Finales";
                        break;
                    case Tournament.PHASE_ENDING:
                        phase="6 - Cloture du tournoi";
                        break;
                    default:
                        phase="Toutes les phases";
                        break;
                }

            %>
            <h5><%=phase%></h5>
        </td>
        <td>
            <a href="tvScreenEdit.jsp?screenId=<%=screen.getId()%>">
                <button type="button" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-pencil"></span>
                    Modifier
                </button>
            </a>
            <br/><br>
            <a href="tvScreenPhotoUpload.jsp?screenId=<%=screen.getId()%>">
                <button type="button" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-camera"></span>
                    Changer photo
                </button>
            </a>
        </td>
    </tr>

    <%
         }
    %>
</table>

<a href="tvScreenEdit.jsp">
    <button class="btn btn-danger">Créer un nouvel écran</button>
</a>

<br/>

<jsp:include page="footer.jsp"/>
