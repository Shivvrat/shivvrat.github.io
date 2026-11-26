---
title: "Publications"
layout: gridlay
permalink: /publications/
years: [2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026]
scholar:
  bibliography_template: bibtemplate
  bibtex_skip_fields: [abstract, month_numeric, comment, file, library, website, pdf, preview, award, selected, abbr, tags, bibtex_show, poster, slides, code]
---


<div class="alert" style="background-color: #FEF3E2; border: 1px solid #F5DEB3; border-radius: 12px; color: #333; padding: 4px 6px; margin-bottom: 12px;">
For research publications from the ARIA Research Lab, please visit the <a href="https://aria-research-lab.github.io/publications" target="_blank">ARIA Lab publications page</a>. You can also visit <a href="https://scholar.google.com/citations?user=eM1co-kAAAAJ&hl=en" target="_blank">Dr. Arya's Google Scholar profile</a>.
</div>

<div id="pub-controls" class="pub-controls" markdown="0">
<div class="pub-controls-row">
  <input type="search" id="pub-search-input" class="pub-search-input" placeholder="Search publications by title, author, venue, or topic..." aria-label="Search publications">
  <button type="button" id="pub-filter-toggle" class="pub-filter-toggle" aria-expanded="false" aria-controls="pub-filter-bar"><span>Filter</span><span class="pub-filter-arrow" aria-hidden="true">&#9656;</span></button>
</div>
<div id="pub-filter-status" class="pub-filter-status" aria-live="polite" hidden></div>
<div id="pub-filter-bar" class="pub-filter-bar" aria-label="Filter publications by topic" hidden></div>
</div>

<div class="jumbotron">
  <h2 class="bib-subsection-title">Dissertation</h2>
  {% bibliography --query @phdthesis %}

</div>

<div class="jumbotron">
  <h2 class="bib-subsection-title">Papers &amp; Preprints</h2>
  {% bibliography --query !@phdthesis[year!=0] %}
</div>

<script src="{{ '/assets/js/pub-filters.js' | relative_url }}" defer></script>



<!-- <div class="jumbotron">
  <h2 class="bib-subsection-title">Under Review</h2>
  {% bibliography --query @*[year=0] %}
</div> -->
