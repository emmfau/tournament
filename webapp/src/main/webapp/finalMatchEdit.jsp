<%@page import="fr.nacvolley.tournament.model.*" %>
<jsp:include page="header.jsp"/>

<%

    String tournamendId = (String) session.getAttribute("tournamentId");
    String matchId = (String) request.getParameter("matchId");
    Tournament tn = Tournament.load(tournamendId);

    Match currentMatch = null;
    boolean matchFound = false;
    for (Group group : tn.getFinalGroups()) {
        for (Tour tour : group.getFinalTours()) {
            for (Match match : tour.getMatchs()) {
                if (match.getId().equals(matchId)) {
                    matchFound = true;
                    currentMatch = match;
                    break;
                }
            }
            if (matchFound) {
                break;
            }
            if (matchFound) {
                break;
            }
        }
    }

    // Teams
    Team team1 = tn.searchTeam(currentMatch.getTeam1Id());
    Team team2 = tn.searchTeam(currentMatch.getTeam2Id());

%>

<div class="row">

    <h1>
        <%
            String team1Name = null;
            if (team1 != null) {
                team1Name = team1.getName();
            } else {
                team1Name = "--------";
            }
            String team2Name = null;
            if (team2 != null) {
                team2Name = team2.getName();
            } else {
                team2Name = "--------";
            }
        %>
        Match : <%=team1Name%> / <%=team2Name%>
    </h1>
    <br/>

    <form name="finalMatchUpdateForm" action="finalMatchUpdate.jsp" method="post" role="form">
        <input type="hidden" name="matchId" value="<%=matchId%>"/>

        <div class="form-group">
            <label for="score1">Score pour <%=team1Name%>
            </label>
            <input type="text" name="score1" class="form-control" value="<%=currentMatch.getScore1()%>"/>
        </div>
        <div class="form-group">
            <label for="score2">Score pour <%=team2Name%>
            </label>
            <input type="text" name="score2" class="form-control" value="<%=currentMatch.getScore2()%>"/>
        </div>


        <div class="form-group">
            <label for="state">Etat</label>

            <div class="radio">
                <label>
                    <input type="radio" name="state" id="stateRadios1"
                           value="wait" <%if (currentMatch.getState().equals(Match.WAIT)) { out.print("checked"); }%>>
                    En attente
                </label>
            </div>
            <div class="radio">
                <label>
                    <input type="radio" name="state" id="optionsRadios2"
                           value="play" <%if (currentMatch.getState().equals(Match.PLAY)) { out.print("checked"); }%>>
                    En cours
                </label>
            </div>
            <div class="radio">
                <label>
                    <input type="radio" name="state" id="optionsRadios3"
                           value="end" <%if (currentMatch.getState().equals(Match.END)) { out.print("checked"); }%>>
                    Terminé (note : ce choix permet d'enregistrer l'équipe gagnante pour le tour suivant)
                </label>
            </div>
        </div>

        <div class="form-group">
            <label for="field">Terrain</label>
            <input type="text" name="field" class="form-control" value="<%=currentMatch.getField()%>"/>
        </div>
        <button type="submit" class="btn btn-danger">Enregistrer</button>
    </form>


</div>
<br/>
<jsp:include page="footer.jsp"/>
