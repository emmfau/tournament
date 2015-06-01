<jsp:include page="tvHeader.jsp"/>


<section>
  <h2>Les 3 prochains matchs</h2>
  <table>
    <tbody>
    <tr>
      <td>Les caimans majestueux</td>
      <td>&nbsp;</td>
      <td>/</td>
      <td>&nbsp;</td>
      <td>Les moustiques sulfureux</td>
      <td>&nbsp;</td>
    </tr>

    <tr>
      <td>Les gorilles bavarois</td>
      <td>&nbsp;</td>
      <td>/</td>
      <td>&nbsp;</td>
      <td>Les coqs hardis</td>
      <td>&nbsp;</td>
    </tr>

    <tr>
      <td>Les urubus insupportables</td>
      <td>&nbsp;</td>
      <td>/</td>
      <td>&nbsp;</td>
      <td>Les moustiques passionnants</td>
      <td>&nbsp;</td>
    </tr>

    </tbody>
  </table>

</section>


<section data-background="../images/background1.png">
  Les caimans majestueux
</section>
<section data-background="../images/vs2.png">
</section>
<section data-background="../images/background1.png">
  Les moustiques sulfureux
</section>

<section>
<h2>.../...</h2>
</section>

<section data-background="../images/background1.png">
  Les gorilles bavarois
</section>
<section data-background="../images/vs2.png">
</section>
<section data-background="../images/background1.png">
  Les coqs hardis
</section>

<section>
  <h2>.../...</h2>
</section>




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

    transition: 'fade', // none/fade/slide/convex/concave/zoom
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


</script>

</body>
</html>
