---
title: "News"
layout: textlay
sitemap: false
permalink: /allnews.html
---
<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">

## News

<div class="jumbotron">
{% for article in site.data.news %}
<!-- highlight the date and add calendar icon -->
<i class="fas fa-calendar-alt"></i>
<b>{{ article.date }}</b>

{{ article.headline }}
{% endfor %}
</div>