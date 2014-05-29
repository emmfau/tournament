<%@page import="fr.nacvolley.tournament.model.Tournament" %>
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
    <style>
        body {
            padding-top: 70px;
            padding-bottom: 30px;
        }

        .theme-dropdown .dropdown-menu {
            position: static;
            display: block;
            margin-bottom: 20px;
        }

        .theme-showcase > p > .btn {
            margin: 5px 0;
        }
    </style>

</head>
<body>

<!-- Fixed navbar -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" rel="home" href="index.jsp" title="tournois"><img
                    style="max-width:100px; margin-top: -12px;" src="images/logo-navbar-inverse-small.png"/></a>

        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <% if (session.getAttribute("tournamentId") != null) {
                    String tournamendId = (String) session.getAttribute("tournamentId");
                    Tournament tn = Tournament.load(tournamendId);
                %>
                <li><a class="navbar-brand" href="tournament.jsp"><%=tn.getName()%>
                </a></li>
                <li><a href="teams.jsp">Equipes</a></li>
                <li><a href="qualifs.jsp">Qualifs : groupes</a></li>
                <li><a href="qualifMatchs.jsp">Qualifs : matchs</a></li>
                <li><a href="finals.jsp">Finales</a></li>
                <li><a href="admin.jsp">Paramètres</a></li>
                <% } %>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</div>

<div class="container">
