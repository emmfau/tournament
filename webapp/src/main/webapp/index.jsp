<%@page import="fr.nacvolley.tournament.model.Tournament,java.text.SimpleDateFormat, java.util.List" %>
<jsp:include page="header.jsp"/>

<div class="container theme-showcase" role="main">
    <div class="jumbotron">
        <h1><img src="images/logo-jumbotron.png"/> tournois</h1>
        <h4>
            <ul>
                <li>Et si on organisait un tournoi ? Bon par contre, faut g�rer les �quipes, les poules, les matchs, les
                    �liminatoires ... gal�re.
                </li>
                <li>Ce serait bien qu'on trouve un truc tout pr�t, et qu'on puisse g�rer le tournoi facilement et �
                    plusieurs.
                </li>
                <li>Genre un site web pour g�rer les tournois, qui marche sur ordinateur, tablette, ou smartphone ?</li>
            </ul>
        </h4>
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
            <th>Date de cr�ation</th>
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

    <h1>Cr�er un nouveau tournoi</h1>

    <form name="tournamendCreateForm" action="indexCreateAction.jsp" method="post" role="form">
        <div class="form-group">
            <label for="name">Nom du nouveau tournoi</label>
            <input type="text" name="name" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="name">Nouveau mot de passe pour param�trer ce tournoi</label>
            <input type="password" name="password" class="form-control"/>
        </div>
        <button type="submit" class="btn btn-danger">Cr�er</button>
    </form>

    <jsp:include page="footer.jsp"/>
