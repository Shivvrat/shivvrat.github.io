---
title: "About"
layout: about
sitemap: false
permalink: /about/
---



{% if site.data.grants %}
<div class="section-card">
## Grants
<ul>
{% for grant in site.data.grants %}
 <li> {{ grant.name }} </li>
{% endfor %}
</ul>
</div>
{% endif %}

<div class="section-card awards-section">
  <h2>Awards & Honors</h2>
  {% assign research_awards = site.data.awards | where: "group", "research" %}
  {% assign professional_awards = site.data.awards | where: "group", "professional" %}
  {% assign earlier_honors = site.data.awards | where: "group", "earlier_honors" %}
  {% include award-list.html awards=research_awards heading="Research Recognition" %}
  {% include award-list.html awards=professional_awards heading="Professional Recognition" %}
  {% include award-list.html awards=earlier_honors heading="Educational Recognition" %}
</div>

{% if site.data.people %}
<div class="section-card">
## Students and mentoring
<ul>
{% for student in site.data.people %}
 <li> {{ student.name }}, {{student.location}} ({{student.degree}}, {{student.year}}) </li>
{% endfor %}
</ul>
</div>
{% endif %}

{% if site.data.collaborators %}
<div class="section-card">
## Collaborators
<ul>
{% for collab in site.data.collaborators %}
 <li> <a href="{{collab.url}}" target="_blank">{{collab.name}}</a> ({{collab.title}})</li>
{% endfor %}
</ul>
</div>
{% endif %}

<!-- <div class="section-card">
  <h2>Sponsors</h2>
  <div style='display:block; text-align:center; margin-left:auto; margin-right:auto;'>
 {% for funder in site.data.funders %}<a href="{{ funder.url }}" target="_blank"><img src='{{ site.baseurl }}/images/logopic/{{ funder.image }}' style='max-height: 80px; max-width: 200px; margin: 1%'/></a>{% endfor %}
  </div>
</div> -->

