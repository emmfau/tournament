<%@page import="fr.nacvolley.tournament.model.Group,fr.nacvolley.tournament.model.Match" %>
<%@ page import="fr.nacvolley.tournament.model.Team" %>
<%@ page import="fr.nacvolley.tournament.model.Tournament" %>
<jsp:include page="header.jsp"/>

<%

    String tournamendId = (String) session.getAttribute("tournamentId");
    String matchId = (String) request.getParameter("matchId");
    Tournament tn = Tournament.load(tournamendId);
    // Search group and match
    boolean matchFound = false;
    Group currentGroup = null;
    Match currentMatch = null;
    for (Group group : tn.getQualifGroups()) {
        for (Match match : group.getMatchs()) {
            if (match.getId().equals(matchId)) {
                matchFound = true;
                currentGroup = group;
                currentMatch = match;
                break;
            }
        }
        if (matchFound) {
            break;
        }
    }
    // Teams
    Team team1 = tn.searchTeam(currentMatch.getTeam1Id());
    Team team2 = tn.searchTeam(currentMatch.getTeam2Id());

%>

<div class="row">

    <h1>
        <span class="label label-success">Groupe <%=tn.getQualifGroups().indexOf(currentGroup) + 1%></span> Match
        : <%=team1.getName()%> / <%=team2.getName()%>
    </h1>
    <br/>

    <form name="qualifMatchUpdateForm" action="qualifMatchUpdate.jsp" method="post" role="form">
        <input type="hidden" name="matchId" value="<%=matchId%>"/>

        <div class="form-group">
            <label for="score1">Score pour <%=team1.getName()%>
            </label>
            <input type="text" name="score1" class="form-control" value="<%=currentMatch.getScore1()%>"/>
        </div>
        <div class="form-group">
            <label for="score2">Score pour <%=team2.getName()%>
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
                    Terminé
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
