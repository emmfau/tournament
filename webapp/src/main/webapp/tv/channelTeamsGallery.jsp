<jsp:include page="tvHeader.jsp"/>

<jsp:include page="programAllTeams.jsp"/>

<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<%
  SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm"); // ou "d/M - HH:mm"
%>
<section data-state="endstate">
  <h2>...</h2>
</section>

</div>

<div class="footer">
  <h1><%=dateFormat.format(new Date())%></h1>
</div>

</div>

<script src="lib/js/head.min.js"></script>
<script src="js/reveal.js"></script>

<script>

  // Full list of configuration options available at:
  // https://github.com/hakimel/reveal.js#configuration
  Reveal.initialize({
    controls: false,
    progress: true,
    history: false,
    center: true,

    transition: 'slide', // none/fade/slide/convex/concave/zoom
    autoSlide: 5000,
    autoSlideStoppable: false,
    hideAddressBar: true,
    loop: true,
    // Optional reveal.js plugins
    dependencies: [
      { src: 'lib/js/classList.js', condition: function() { return !document.body.classList; } },
      { src: 'plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
      { src: 'plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
      { src: 'plugin/highlight/highlight.js', async: true, condition: function() { return !!document.querySelector( 'pre code' ); }, callback: function() { hljs.initHighlightingOnLoad(); } },
      { src: 'plugin/zoom-js/zoom.js', async: true },
      { src: 'plugin/notes/notes.js', async: true }
    ]
  });

  Reveal.addEventListener( 'endstate', function() {
    window.location.href='channelTeamsGallery.jsp';
  } );

</script>

</body>
</html>
