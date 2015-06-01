<%@page import="fr.nacvolley.tournament.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!doctype html>
<html lang="fr">

<head>
  <meta charset="iso-8859-1">

  <title>
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
    %>

  </title>

  <meta name="description" content="Tournoi TV"/>

  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />

  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui">

  <link rel="stylesheet" href="css/reveal.css">
  <link rel="stylesheet" href="css/theme/black.css" id="theme">

  <!-- Code syntax highlighting -->
  <link rel="stylesheet" href="lib/css/zenburn.css">

  <!-- Printing and PDF exports -->
  <script>
    var link = document.createElement( 'link' );
    link.rel = 'stylesheet';
    link.type = 'text/css';
    link.href = window.location.search.match( /print-pdf/gi ) ? 'css/print/pdf.css' : 'css/print/paper.css';
    document.getElementsByTagName( 'head' )[0].appendChild( link );
  </script>

  <!--[if lt IE 9]>
  <script src="lib/js/html5shiv.js"></script>
  <![endif]-->

  <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon"/>

  <!-- for fixed footer, to display time -->
  <style>
    .reveal .footer {
      position: absolute;
      bottom: 0.1em;
      right: 0.1em;
      font-size: 0.5em;
    }
  </style>
</head>

<body>

<div class="reveal">

  <!-- Any section element inside of this container is displayed as a slide -->
  <div class="slides">


