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
<link rel="stylesheet" href="{{ '/assets/css/bibliography.css' | relative_url }}">

<div class="section-card">
## Invited Talks
{% bibliography --query @talk[type ^= invited] %}
</div>

<div class="section-card">
## Conference / Award Presentations
{% bibliography --query @talk[type ^= award] %}
</div>
