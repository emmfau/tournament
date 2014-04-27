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

<div class="navbar navbar-static-top">
    <div class="navbar-header pull-left">
        <a href="teams.jsp">
            <button type="button" class="btn btn-primary navbar-btn">Equipes</button>
        </a>
        <a href="qualifs.jsp">
            <button type="button" class="btn btn-primary navbar-btn">Qualifs</button>
        </a>
        <a href="finals.jsp">
            <button type="button" class="btn btn-primary navbar-btn">Finales</button>
        </a>
        <% if (session.getAttribute("admin") != null) { %>
        <a href="admin.jsp">
            <button type="button" class="btn btn-danger navbar-btn"><span class="glyphicon glyphicon-pencil"></span>
            </button>
        </a>
        <% } else { %>
        <a href="admin.jsp">
            <button type="button" class="btn btn-primary navbar-btn"><span class="glyphicon glyphicon-pencil"></span>
            </button>
        </a>
        <% } %>
    </div>
</div>

<div class="container">
