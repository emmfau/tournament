<%@page import="fr.nacvolley.tournament.model.Group,fr.nacvolley.tournament.model.Match" %>
<%@ page import="fr.nacvolley.tournament.model.Tournament" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
    String tournamendId = (String) session.getAttribute("tournamentId");
    Tournament tn = Tournament.load(tournamendId);

    // Constitution de la liste des matchs ( dans l'ordre des groupes, puis dans l'ordre des matchs)
    List<Match> allMatchs = new ArrayList<Match>();
    for (Group group : tn.getQualifGroups()) {
        List<Match> groupMatchs = new ArrayList<Match>();
        int s = group.getTeamsIds().size();
        // Création de la matrice de matchs
        for (int x = 0; x < s; x++) {
            for (int y = 0; y < s; y++) {
                if (y > x) {
                    Match m = new Match();
                    m.setTeam1Id(group.getTeamsIds().get(x));
                    m.setTeam2Id(group.getTeamsIds().get(y));
                    groupMatchs.add(m);
                }
            }
        }

        // Réordonner : Match 0, match N, match 1, match N-1, match 2, match N-2, etc..
        // [BUG : si chiffre impair d'équipes, en sortie il n'y a plus le bon nombre de matchs ]
        List<Match> orderedGroupMatchs = new ArrayList<Match>();
        // Ordonnancement des matchs
        int iStart = 0;
        int iEnd = groupMatchs.size() - 1;
        if (iEnd % 2 == 0) { // Si chiffre impair alors on incrémente au prochain multiple de 2.
            iEnd++;
        }
        while (iStart < iEnd) {
            orderedGroupMatchs.add(groupMatchs.get(iStart));
            if (iEnd < groupMatchs.size()) {
                orderedGroupMatchs.add(groupMatchs.get(iEnd));
            }
            iStart++;
            iEnd--;
        }

        // Affichage
        /*for (Match m:orderedGroupMatchs) {
            Team t1=tn.searchTeam(m.getTeam1Id());
            Team t2=tn.searchTeam(m.getTeam2Id());
            out.println(t1.getName()+" - "+t2.getName()+"<br>");
        }*/
        //out.println("<hr>");

        // Affectation des matchs
        group.setMatchs(orderedGroupMatchs);
    }


    tn.save();
    response.sendRedirect("qualifMatchs.jsp");
%>