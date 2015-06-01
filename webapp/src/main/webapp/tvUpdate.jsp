<%@page import="fr.nacvolley.tournament.model.Team,fr.nacvolley.tournament.model.Tournament" %>
<%
  String tournamendId = (String) session.getAttribute("tournamentId");
  Tournament tn = Tournament.load(tournamendId);
  int phase = Integer.parseInt((String) request.getParameter("phase"));
  tn.getTv().setPhase(phase);
  tn.save();
  response.sendRedirect("tvEdit.jsp");
  %>
