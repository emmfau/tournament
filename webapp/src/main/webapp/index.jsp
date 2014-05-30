<%@page import="fr.nacvolley.tournament.model.Tournament,java.text.SimpleDateFormat, java.util.List" %>
<jsp:include page="header.jsp"/>

<div class="container theme-showcase" role="main">
    <div class="jumbotron">
        <h1><img src="images/logo-jumbotron.png"/> tournoi</h1>
        <h4>
            <i>Et si on organisait un tournoi ? Bon par contre, faut gérer les équipes, les poules, les matchs, les
                éliminatoires ... pfffff. Ce serait bien qu'on trouve un truc tout prêt, et qu'on puisse gérer le
                tournoi facilement, et à
                plusieurs. Genre un site web pour gérer un tournoi, qui marche sur ordinateur, tablette, ou smartphone ?
            </i>
        </h4>

        <p><span class="glyphicon glyphicon-thumbs-up"></span>
            Bravo, vous venez de trouver un site qui fait çà !</p>
    </div>

    <h1>Liste des tournois</h1>
    <script>
        function tournament(id) {
            window.location.href = "indexAction.jsp?id=" + encodeURIComponent(id);
        }

    </script>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Nom</th>
            <th>Date de création</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Tournament> tns = Tournament.listAll();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
            for (Tournament tn : tns) {
        %>
        <tr>
            <td>
                <a href="javascript:tournament('<%=tn.getId()%>')">
                    <%=tn.getName()%>
                </a>
            </td>
            <td><%=sdf.format(tn.getDate())%>
            </td>
            <td>

            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <br/>

    <h1>Créer un nouveau tournoi</h1>

    <form name="tournamendCreateForm" action="indexCreateAction.jsp" method="post" role="form">
        <div class="form-group">
            <label for="name">Nom du nouveau tournoi</label>
            <input type="text" name="name" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="name">Nouveau mot de passe pour paramétrer ce tournoi</label>
            <input type="password" name="password" class="form-control"/>
        </div>
        <button type="submit" class="btn btn-danger">Créer</button>
    </form>
    <br/>

    <div style="text-align: center">
        <h5>
            <p>
                <a href="https://twitter.com/emmfau" class="twitter-follow-button" data-link-color="#0069D6"
                   data-show-count="true">Suivre @emmfau</a>
                <script>!function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https';
                    if (!d.getElementById(id)) {
                        js = d.createElement(s);
                        js.id = id;
                        js.src = p + '://platform.twitter.com/widgets.js';
                        fjs.parentNode.insertBefore(js, fjs);
                    }
                }(document, 'script', 'twitter-wjs');</script>
                <iframe src="http://ghbtns.com/github-btn.html?user=emmfau&repo=tournament&type=watch&count=true"
                        allowtransparency="true" frameborder="0" scrolling="0" width="110" height="20"></iframe>
            </p>
        </h5>
    </div>


    <jsp:include page="footer.jsp"/>
