---
title: "Publications"
layout: gridlay
sitemap: false
permalink: /publications/
years: [2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025]
scholar:
  bibliography_template: bibtemplate
---


<div class="alert" style="background-color: #FEF3E2; border: 1px solid #F5DEB3; border-radius: 12px; color: #333; padding: 4px 6px; margin-bottom: 12px;">
For latest publications and preprints, please visit the <a href="https://aria-research-lab.github.io/publications" target="_blank">ARIA Lab publications page</a>.
</div>

<div class="jumbotron">
  {% bibliography --query @*[year!=0] %}

</div>

<div class="jumbotron">
  <h2 class="bib-subsection-title">Under Review</h2>
  {% bibliography --query @*[year=0] %}
</div>
