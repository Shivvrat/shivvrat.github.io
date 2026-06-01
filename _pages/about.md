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
  <ul class="awards-list">
    {% for award in site.data.awards %}
    <li class="award-item">
      <span class="award-title">
        {% assign awardName = award.name | replace: "-", "&#8211;" %}
        <span class="award-icon">
          {% if award.type == "presentation" %}
            🎤
          {% elsif award.type == "scholarship" %}
            🎓
          {% elsif award.type == "paper award" %}
            🏅
          {% elsif award.type == "certificate" %}
            📜
          {% elsif award.type == "fellowship" %}
            🤝
          {% elsif award.type == "travel award" %}
            ✈️
          {% elsif award.type == "grant" %}
            💰
          {% elsif award.type == "other" %}
            🏆
          {% elsif award.type == "honor" %}
            🎖️
          {% elsif award.type == "professional recognition" %}
            🌟
          {% else %}
            🏆
          {% endif %}
        </span>
        {{ awardName }}
      </span>
      {% if award.event %}
        <p class="award-event"><em>{{ award.event }}</em></p>
      {% endif %}
      {% if award.description %}
        <p class="award-description">{{ award.description }}</p>
      {% endif %}
      {% if award.certificate %}
        <div style=" margin-top: 10px;">
          <a href="{{ award.certificate }}" target="_blank" class="btn btn-certificate">
            <i class="fa fa-certificate" style="margin-right: 8px;"></i>View Certificate</a>
        </div>
      {% endif %}
    </li>
    {% endfor %}
  </ul>
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

<div class="section-card">
  <h2>Sponsors</h2>
  <div style='display:block; text-align:center; margin-left:auto; margin-right:auto;'>
 {% for funder in site.data.funders %}<a href="{{ funder.url }}" target="_blank"><img src='{{ site.baseurl }}/images/logopic/{{ funder.image }}' style='max-height: 80px; max-width: 200px; margin: 1%'/></a>{% endfor %}
  </div>
</div>

