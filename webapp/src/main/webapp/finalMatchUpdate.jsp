<%@page import="fr.nacvolley.tournament.model.Group,fr.nacvolley.tournament.model.Match" %>
<%@ page import="fr.nacvolley.tournament.model.Tour" %>
<%@ page import="fr.nacvolley.tournament.model.Tournament" %>

<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    String matchId = (String) request.getParameter("matchId");
    Tournament tn = Tournament.load(tournamendId);

    Tour currentTour = null;
    Match currentMatch = null;
    int currentTourIndex = -12;
    int currentMatchIndex = -12;
    int currentTeamIndex = -12;
    String nextMatchId = null;
    boolean matchFound = false;

    for (Group group : tn.getFinalGroups()) {

        for (Tour tour : group.getFinalTours()) {

            for (Match match : tour.getMatchs()) {

                // Action sur le match courant passé en paramètre de modification
                if (match.getId().equals(matchId)) {
                    currentMatch = match;
                    currentMatchIndex = tour.getMatchs().indexOf(match);
                    nextMatchId = currentMatch.getNextMatchId();
                    currentMatch.setScore1(Integer.parseInt((String) request.getParameter("score1")));
                    currentMatch.setScore2(Integer.parseInt((String) request.getParameter("score2")));
                    currentMatch.setState((String) request.getParameter("state"));
                    currentMatch.setField((String) request.getParameter("field"));
                    //currentMatch.save();
                    // TODO : quick fix done for couchdb test, but prefer save each match individually to avoid conflicts

                }

                // Action sur le match suivant pour fixer l'équipe
                // A trouver avec critères : tour + 1, et index /2 + index %2
                if (nextMatchId != null && match.getId().equals(nextMatchId)) {
                    //if ( (nextTourIndex==currentTourIndex+1) && (nextMatchIndex==(currentMatchIndex/2)) ) {
                    if (currentMatch.getState().equals(Match.END)) {
                        if (currentMatchIndex % 2 == 0) {
                            // Le vainqueur du match précédent sera en team1
                            if (currentMatch.getScore1() > currentMatch.getScore2()) {
                                match.setTeam1Id(currentMatch.getTeam1Id());
                            } else {
                                match.setTeam1Id(currentMatch.getTeam2Id());
                            }
                        } else {
                            // Le vainqueur du match précédent sera en team2
                            if (currentMatch.getScore1() > currentMatch.getScore2()) {
                                match.setTeam2Id(currentMatch.getTeam1Id());
                            } else {
                                match.setTeam2Id(currentMatch.getTeam2Id());
                            }
                        }
                    }
                    //match.save();
                    // TODO : quick fix done for couchdb test, but prefer save each match individually to avoid conflicts

                }

            }

        }
    }

    // TODO : quick fix done for couchdb test, but prefer save each match individually to avoid conflicts
    tn.save();

    response.sendRedirect("finals.jsp");
%>


