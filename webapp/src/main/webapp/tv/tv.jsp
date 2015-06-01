<%@page import="fr.nacvolley.tournament.model.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%
Tournament tn=null;
if (session.getAttribute("tournamentId") != null) {
	String tournamendId = (String) session.getAttribute("tournamentId");
	tn = Tournament.load(tournamendId);
}
if (tn != null) {
	out.print(tn.getName());
} else {
	out.print("tournoi");
}

// Call the appropriate TV Channel , with the associated tournament phase

Tv tv=tn.getTv();
String channel=null;
switch (tv.getPhase()) {
	case Tournament.PHASE_OPENING:
		channel="channelOpening.jsp";
		break;
	case Tournament.PHASE_PREPARING_QUALIFS:
		channel="channelPreparingQualifs.jsp";
		break;
	case Tournament.PHASE_PLAYING_QUALIFS:
		channel="channelPlayingQualifs.jsp";
		break;
	case Tournament.PHASE_PREPARING_FINALS:
		channel="channelPreparingFinals.jsp";
		break;
	case Tournament.PHASE_PLAYING_FINALS:
		channel="channelPlayingFinals.jsp";
		break;
	case Tournament.PHASE_ENDING:
		channel="channelEnding.jsp";
		break;
	default:
		break;
}
response.sendRedirect(channel);
%>
