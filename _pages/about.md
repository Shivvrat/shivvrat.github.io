---
title: "About"
layout: about
sitemap: false
permalink: /about/
---
## About 

{% for member in site.data.pi %}
<div class="jumbotron">
<div class="row">
<div class="col-sm-4">
  <img src="{{ site.url }}{{ site.baseurl }}/images/teampic/{{ member.photo }}" width="100%" style="max-width:250px"/>
</div>
<div class="col-sm-8 col-xs-12">
  <h3>{{ member.name }}</h3>
  <h4><i>{{ member.info }}</i></h4>
  {% if member.email %}<a href="mailto:{{ member.email }}" target="_blank"><i class="fa fa-envelope-square fa-3x"></i></a> {% endif %}
  {% if member.cv %} <a href="{{ site.url }}{{ site.baseurl }}/{{ member.cv }}" target="_blank"><i class="ai ai-cv-square ai-3x"></i></a> {% endif %}
  {% if member.scholar %} <a href="{{ member.scholar }}" target="_blank"><i class="ai ai-google-scholar-square ai-3x"></i></a> {% endif %}
  {% if member.github %} <a href="{{ member.github }}" target="_blank"><i class="fa fa-github-square fa-3x"></i></a> {% endif %}
  {% if member.researchgate %} <a href="{{ member.researchgate }}" target="_blank"><i class="ai ai-researchgate-square ai-3x"></i></a> {% endif %}

  <ul style="overflow: hidden">
  {% if member.number_educ == 1 %}
  <li> {{ member.education1 | replace: "-","&#8211;"}} </li>
  {% endif %}
  {% if member.number_educ == 2 %}
  <li> {{ member.education1 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education2 | replace: "-","&#8211;"}} </li>
  {% endif %}
  {% if member.number_educ == 3 %}
  <li> {{ member.education1 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education2 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education3 | replace: "-","&#8211;"}} </li>
  {% endif %}
  {% if member.number_educ == 4 %}
  <li> {{ member.education1 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education2 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education3 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education4 | replace: "-","&#8211;"}} </li>
  {% endif %}
  {% if member.number_educ == 5 %}
  <li> {{ member.education1 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education2 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education3 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education4 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education5 | replace: "-","&#8211;"}} </li>
  {% endif %}
  {% if member.number_educ == 6 %}
  <li> {{ member.education1 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education2 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education3 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education4 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education5 | replace: "-","&#8211;"}} </li>
  <li> {{ member.education6 | replace: "-","&#8211;"}} </li>
  {% endif %}
  </ul>
</div>
</div>
</div>
{% endfor %}

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
          <a href="{{ award.certificate }}" target="_blank" class="btn btn-certificate" style="color: white; background-color: #8b0000; padding: 8px 20px; text-decoration: none; border-radius: 5px; transition: all 0.3s ease; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
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

