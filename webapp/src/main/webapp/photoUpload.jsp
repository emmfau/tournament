<jsp:include page="header.jsp"/>
<%
    String teamId = (String) request.getParameter("teamId");
%>
<h3>Modification de la photo d'équipe</h3>

<form method="post" action="upload" enctype="multipart/form-data">
    <input type="hidden" name="teamId" value="<%=teamId%>"/>
    <input type="file" name="dataFile" id="fileChooser"/><br/><br/>
    <input type="submit" value="Enregistrer" class="btn btn-danger"/>
</form>
<jsp:include page="footer.jsp"/>

