---
title: "Talks"
layout: gridlay
sitemap: false
permalink: /talks/
---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">

<div class="jumbotron">
### Invited talks
{% bibliography --query @incollection[keywords ^= invited] %}
</div>

<div class="jumbotron">
### Regular talks
{% bibliography --query @incollection[keywords != invited] %}
</div>

