<jsp:include page="header.jsp"/>

<div class="jumbotron">
    <h3><span class="glyphicon glyphicon-question-sign"></span> Aide / Guide d'utilisation (pour les gentils
        organisateurs de tournois)</h3>
    <h4>
        <ul>
            <li>Dans la page <a href="admin.jsp">Param�tres</a>, activer le mode administration � l'aide du mot de passe
                du tournoi (si vous venez de cr�er un nouveau
                tournoi, vous �tes automatiquement en mode administration).
            </li>
            <li>Dans la page <a href="teams.jsp">Equipes</a>, cr�er les diff�rentes �quipes qui participeront.</li>
            <li>Une fois toutes les �quipes pr�tes : dans les <a href="admin.jsp">Param�tres</a>, v�rifiez les
                param�tres des qualifications et finales.
            </li>
            <li>Dans la page <a href="admin.jsp">Param�tres</a>, cr�er/recr�er les groupes de qualifications (les
                ventilations des �quipes sont en
                fonction du niveau saisi dans la cr�ation d'une �quipe, avec un peu de hasard).
            </li>
            <li>Dans la page <a href="admin.jsp">Param�tres</a>, une fois les groupes de qualifs pr�ts, cr�er/recr�er
                les matchs de qualifications.
            </li>
            <li>Lancez les matchs de qualifs ! Dans la page <a href="qualifMatchs.jsp">Matchs de qualifs</a>, modifiez
                les matchs de qualifs au fur et � mesure. Consultez les r�sultats des groupes de qualifs dans
                la page <a href="qualifs.jsp">Groupes de qualifs</a>.
            </li>
            <li>Une fois les qualifs termin�es, dans la page <a href="admin.jsp">Param�tres</a>, cr�er/recr�er les
                groupes et matchs de finales.
            </li>
            <li>Lancez les matchs ! Dans la page <a href="finals.jsp">Finales</a>, modifiez les matchs de finales au fur
                et � mesure.
            </li>
            <li>Une fois les finales termin�es, .. bah c'est fini :)</li>
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
