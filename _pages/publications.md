---
title: "Publications"
layout: gridlay
sitemap: false
permalink: /publications/
years: [2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025]
scholar:
  bibliography_template: bibtemplate
---

<div class="jumbotron">
  {% bibliography --query @*[year!=0] --group_by year %}
</div>

<div class="jumbotron">
  <h2 class="bib-subsection-title">Under Review</h2>
  {% bibliography --query @*[year=0] %}
</div>
