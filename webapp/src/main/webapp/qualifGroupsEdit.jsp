<%@page import="fr.nacvolley.tournament.model.Group,fr.nacvolley.tournament.model.Team" %>
<%@ page import="fr.nacvolley.tournament.model.Tournament" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);
    List<Team> teams = tn.getTeams();
    // Trier les Ã©quipes selon leur niveau. Si égal, alors tri aléatoire
    Collections.sort(teams, Group.qualifEditComparator);
    // Création des groupes à partir des paramètres
    List<Group> qualifGroups = new ArrayList<Group>();
    // Initialisation des groupes
    for (int i = 0; i < tn.getQualifNbGroups(); i++) {
        qualifGroups.add(new Group());
    }

    // Parcours des équipes et remplissage de chaque poule au fur et à mesure
    int groupIndex = 0;
    for (Team t : teams) {
        qualifGroups.get(groupIndex).getTeamsIds().add(t.getId());
        groupIndex++;
        if (groupIndex == tn.getQualifNbGroups()) {
            groupIndex = 0;
        }
    }

    // Enregistrement des groupes de qualif
    tn.setQualifGroups(qualifGroups);
    tn.save();
    response.sendRedirect("qualifs.jsp");
%>
