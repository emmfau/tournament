<%@page import="fr.nacvolley.tournament.model.Team,fr.nacvolley.tournament.model.Tournament" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);

    boolean isNew = (request.getParameter("isNew") != null);
    Team team;

    if (isNew) { // create
        team = new Team(); // with fresh teamId
    } else { // update
        String teamId = (String) request.getParameter("teamId");
        team = tn.searchTeam(teamId);
    }

    team.setName((String) request.getParameter("name"));
    team.setCaptainName((String) request.getParameter("captainName"));
    team.setClub((String) request.getParameter("club"));
    team.setComments((String) request.getParameter("comments"));
    team.setEmail((String) request.getParameter("email"));
    team.setLevel(Integer.parseInt((String) request.getParameter("level")));
    team.setPhone((String) request.getParameter("phone"));
    team.setPlayersNames((String) request.getParameter("playersName"));
    team.setState((String) request.getParameter("state"));

    if (isNew) {
        tn.getTeams().add(team);
        tn.save();
    } else {
        team.save();
    }

    response.sendRedirect("teams.jsp");
%>
