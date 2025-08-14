---
title: "About"
layout: about
sitemap: false
permalink: /about/
---



{% if site.data.grants %}
<div class="jumbotron">
### Grants
<ul>
{% for grant in site.data.grants %}
 <li> {{ grant.name }} </li>
{% endfor %}
</ul>
</div>
{% endif %}

<div class="jumbotron awards-section">
  <h3>Awards & Honors</h3>
  <ul class="awards-list">
    {% for award in site.data.awards %}
    <li class="award-item">
      <h4 class="award-title">
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
      </h4>
      {% if award.event %}
        <p class="award-event"><em>{{ award.event }}</em></p>
      {% endif %}
      {% if award.description %}
        <p class="award-description">{{ award.description }}</p>
      {% endif %}
      {% if award.certificate %}
        <div style="text-align: center; margin-top: 10px;">
          <a href="{{ award.certificate }}" target="_blank" class="btn btn-certificate">
            <i class="fa fa-certificate" style="margin-right: 8px;"></i>View Certificate</a>
        </div>
      {% endif %}
    </li>
    {% endfor %}
  </ul>
</div>

{% if site.data.people %}
<div class="jumbotron">
### Students and mentoring
<ul>
{% for student in site.data.people %}
 <li> {{ student.name }}, {{student.location}} ({{student.degree}}, {{student.year}}) </li>
{% endfor %}
</ul>
</div>
{% endif %}

{% if site.data.collaborators %}
<div class="jumbotron">
### Collaborators
<ul>
{% for collab in site.data.collaborators %}
 <li> <a href="{{collab.url}}" target="_blank">{{collab.name}}</a> ({{collab.title}})</li>
{% endfor %}
</ul>
</div>
{% endif %}

<div class="jumbotron">
  <h4>Sponsors</h4>
  <div style='display:block; text-align:center; margin-left:auto; margin-right:auto;'>
 {% for funder in site.data.funders %}<a href="{{ funder.url }}" target="_blank"><img src='{{ site.url }}{{ site.baseurl }}/images/logopic/{{ funder.image }}' style='max-height: 80px; max-width: 200px; margin: 1%'/></a>{% endfor %}
  </div>
</div>

