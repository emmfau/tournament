<%@page import="fr.nacvolley.tournament.model.Tournament,java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="iso-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Appli de gestion de tournois">
    <meta name="author" content="Emmanuel FAURE @emmfau">
    <title>Tournois</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<script>
    function tournament(id) {
        window.location.href = "indexAction.jsp?id=" + encodeURIComponent(id);
    }

</script>
<h1>Tous les tournois !</h1>

<table class="table table-striped">
    <thead>
    <tr>
        <th>Nom</th>
        <th>Date</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Tournament> tns = Tournament.listAll();

        for (Tournament tn : tns) {
    %>
    <tr>
        <td>
            <a href="javascript:tournament('<%=tn.getId()%>')">
                <%=tn.getName()%>
            </a>
        </td>
        <td><%=tn.getDate()%>
        </td>
        <td>

        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</div> <!-- fin du div container -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

</body>
</html>

