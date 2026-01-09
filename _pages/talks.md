---
title: "Talks"
layout: gridlay
sitemap: false
permalink: /talks/
scholar:
  bibliography_template: bibtemplate_talks
  bibliography: talks.bib
---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">

<div class="section-card">
## Award Talks
{% bibliography --query @talk[type ^= award] %}
</div>

<div class="section-card">
## Invited Talks
{% bibliography --query @talk[type ^= invited] %}
</div>


