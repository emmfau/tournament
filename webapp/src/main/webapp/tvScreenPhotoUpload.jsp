<jsp:include page="header.jsp"/>
<%
    String screenId = (String) request.getParameter("screenId");
%>
<h3>Modification de la photo de l'écran TV personnalisé</h3>

<form method="post" action="uploadtv" enctype="multipart/form-data">
    <input type="hidden" name="screenId" value="<%=screenId%>"/>
    <input type="file" name="dataFile" id="fileChooser"/><br/><br/>
    <input type="submit" value="Enregistrer" class="btn btn-danger"/>
</form>
<jsp:include page="footer.jsp"/>

