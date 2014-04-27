<%@page import="fr.nacvolley.tournament.model.Tournament" %>
<jsp:include page="header.jsp"/>

<%
    Tournament tn = Tournament.load((String) session.getAttribute("tournamentId"));
%>

<div class="row" align="center">
    <h1><%=tn.getName()%>
    </h1>

    <p><a href="teams.jsp">
        <button type="button" class="btn btn-primary"><%=tn.getTeams().size()%> équipes</button></p>
    </a>
    <p><a href="qualifs.jsp">
        <button type="button" class="btn btn-primary"><%=tn.getQualifGroups().size()%> groupes de qualification</button>
    </p>
    </a>
    <p><a href="finals.jsp">
        <button type="button" class="btn btn-primary"><%=tn.getFinalGroups().size()%> groupes de finale</button></p>
    </a>
</div>

<jsp:include page="footer.jsp"/>