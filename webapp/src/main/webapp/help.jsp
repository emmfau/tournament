<jsp:include page="header.jsp"/>

<div class="jumbotron">
    <h3><span class="glyphicon glyphicon-question-sign"></span> Aide / Guide d'utilisation (pour les gentils
        organisateurs de tournois)</h3>
    <h4>
        <ul>
            <li>Dans la page <a href="admin.jsp">Paramètres</a>, activer le mode administration à l'aide du mot de passe
                du tournoi (si vous venez de créer un nouveau
                tournoi, vous êtes automatiquement en mode administration).
            </li>
            <li>Dans la page <a href="teams.jsp">Equipes</a>, créer les différentes équipes qui participeront.</li>
            <li>Une fois toutes les équipes prêtes : dans les <a href="admin.jsp">Paramètres</a>, vérifiez les
                paramètres des qualifications et finales.
            </li>
            <li>Dans la page <a href="admin.jsp">Paramètres</a>, créer/recréer les groupes de qualifications (les
                ventilations des équipes sont en
                fonction du niveau saisi dans la création d'une équipe, avec un peu de hasard).
            </li>
            <li>Dans la page <a href="admin.jsp">Paramètres</a>, une fois les groupes de qualifs prêts, créer/recréer
                les matchs de qualifications.
            </li>
            <li>Lancez les matchs de qualifs ! Dans la page <a href="qualifMatchs.jsp">Matchs de qualifs</a>, modifiez
                les matchs de qualifs au fur et à mesure. Consultez les résultats des groupes de qualifs dans
                la page <a href="qualifs.jsp">Groupes de qualifs</a>.
            </li>
            <li>Une fois les qualifs terminées, dans la page <a href="admin.jsp">Paramètres</a>, créer/recréer les
                groupes et matchs de finales.
            </li>
            <li>Lancez les matchs ! Dans la page <a href="finals.jsp">Finales</a>, modifiez les matchs de finales au fur
                et à mesure.
            </li>
            <li>Une fois les finales terminées, .. bah c'est fini :)</li>
        </ul>
    </h4>
</div>

<div style="text-align: center">
    <h5>
        <p>Design & code par <a href="https://twitter.com/emmfau">@emmfau</a></p>

        <p>Code disponible sur <a href="http://github.com/emmfau/tournament">github.com/emmfau/tournament</a></p>

        <p>Open source <a href="http://www.apache.org/licenses/LICENSE-2.0.html" target="_blank">Apache License 2.0</a>
        </p>

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
