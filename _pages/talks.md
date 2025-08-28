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

<!-- <div class="jumbotron">
### Invited Talks
{% bibliography --query @talk[type ^= invited] %}
</div> -->

### Award Talks
{% bibliography --query @talk[type ^= award] %}


<!-- <div class="jumbotron">
### Regular talks
{% bibliography --query @talk[type != invited && type != award] %}
</div> -->

