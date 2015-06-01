<%@page import="fr.nacvolley.tournament.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
  Tournament tn=null;
  if (session.getAttribute("tournamentId") != null) {
    String tournamendId = (String) session.getAttribute("tournamentId");
    tn = Tournament.load(tournamendId);
  }

  Tv tv=tn.getTv();
  String phase=null;
  switch (tv.getPhase()) {
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
      phase="6 - Clôture du tournoi";
      break;
    default:
      phase="-";
      break;
  }

  %>
<section>
  <h1><%=tn.getName()%></h1>
  <h3>Phase <%=phase%></h3>
</section>
