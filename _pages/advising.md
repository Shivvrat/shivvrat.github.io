---
title: "Advising"
layout: gridlay
sitemap: false
permalink: /advising/
---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">

## Advising

---

{% if site.data.advising.current_advisees.size > 0 %}
<div class="jumbotron">

### Current Advisees

{% assign number_printed = 0 %}
{% for student in site.data.advising.current_advisees %}

{% assign even_odd = number_printed | modulo: 2 %}

{% if even_odd == 0 %}
<div class="row">
{% endif %}

<div class="col-sm-6 clearfix">
  {% if student.photo %}
  <img src="{{ site.url }}{{ site.baseurl }}/images/teampic/{{ student.photo }}" class="img-responsive" width="25%" style="float: left" />
  {% endif %}
  <h4>{{ student.name }}</h4>
  <i>{{ student.role }}{% if student.start_year %}, Started {{ student.start_year }}{% endif %}</i><br>
  {% if student.research %}<small><strong>Research:</strong> {{ student.research }}</small><br>{% endif %}
  {% if student.coadvisor %}<small><strong>Co-advisor:</strong> {{ student.coadvisor }}</small><br>{% endif %}
  
  {% if student.website %}<a href="{{ student.website }}" target="_blank"><i class="fa fa-home fa-2x"></i></a> {% endif %}
  {% if student.email %}<a href="mailto:{{ student.email }}" target="_blank"><i class="fa fa-envelope-square fa-2x"></i></a> {% endif %}
  {% if student.scholar %}<a href="{{ student.scholar }}" target="_blank"><i class="ai ai-google-scholar-square ai-2x"></i></a> {% endif %}
  {% if student.github %}<a href="{{ student.github }}" target="_blank"><i class="fa fa-github-square fa-2x"></i></a> {% endif %}
</div>

{% assign number_printed = number_printed | plus: 1 %}

{% if even_odd == 1 %}
</div>
{% endif %}

{% endfor %}

{% assign even_odd = number_printed | modulo: 2 %}
{% if even_odd == 1 %}
</div>
{% endif %}

</div>
{% endif %}

{% if site.data.advising.graduated_advisees.size > 0 %}
<div class="jumbotron">

### Graduated Students

<div class="table-responsive">
<table class="table">
<thead>
<tr>
<th>Name</th>
<th>Degree</th>
<th>Year</th>
<th>Thesis/Dissertation</th>
<th>Position</th>
</tr>
</thead>
<tbody>
{% for student in site.data.advising.graduated_advisees %}
<tr>
<td>{% if student.website %}<a href="{{ student.website }}" target="_blank">{{ student.name }}</a>{% else %}{{ student.name }}{% endif %}</td>
<td>{{ student.role }}</td>
<td>{{ student.graduation_year }}</td>
<td>{{ student.thesis_title }}</td>
<td>{% if student.current_position %}{{ student.current_position }}{% else %}{{ student.first_position }}{% endif %}</td>
</tr>
{% endfor %}
</tbody>
</table>
</div>

</div>
{% endif %}

{% if site.data.advising.dissertation_committee.size > 0 %}
<div class="jumbotron">

### PhD Dissertation Committee Member

{% assign current_diss = site.data.advising.dissertation_committee | where: "status", "current" %}
{% assign graduated_diss = site.data.advising.dissertation_committee | where: "status", "graduated" %}

{% if current_diss.size > 0 %}
#### Current

<div class="table-responsive">
<table class="table">
<thead>
<tr>
<th>Student</th>
<th>Title</th>
<th>University</th>
<th>Advisor</th>
</tr>
</thead>
<tbody>
{% for student in current_diss %}
<tr>
<td>{% if student.website %}<a href="{{ student.website }}" target="_blank">{{ student.name }}</a>{% else %}{{ student.name }}{% endif %}</td>
<td>{{ student.title }}</td>
<td>{{ student.university }}</td>
<td>{{ student.advisor }}</td>
</tr>
{% endfor %}
</tbody>
</table>
</div>
{% endif %}

{% if graduated_diss.size > 0 %}
#### Completed

<div class="table-responsive">
<table class="table">
<thead>
<tr>
<th>Student</th>
<th>Title</th>
<th>University</th>
<th>Advisor</th>
<th>Year</th>
</tr>
</thead>
<tbody>
{% for student in graduated_diss %}
<tr>
<td>{% if student.website %}<a href="{{ student.website }}" target="_blank">{{ student.name }}</a>{% else %}{{ student.name }}{% endif %}</td>
<td>{{ student.title }}</td>
<td>{{ student.university }}</td>
<td>{{ student.advisor }}</td>
<td>{{ student.graduation_year }}</td>
</tr>
{% endfor %}
</tbody>
</table>
</div>
{% endif %}

</div>
{% endif %}

{% if site.data.advising.thesis_committee.size > 0 %}
<div class="jumbotron">

### MS Thesis Committee Member

{% assign current_thesis = site.data.advising.thesis_committee | where: "status", "current" %}
{% assign graduated_thesis = site.data.advising.thesis_committee | where: "status", "graduated" %}

{% if current_thesis.size > 0 %}
#### Current

<div class="table-responsive">
<table class="table">
<thead>
<tr>
<th>Student</th>
<th>Title</th>
<th>University</th>
<th>Advisor</th>
</tr>
</thead>
<tbody>
{% for student in current_thesis %}
<tr>
<td>{% if student.website %}<a href="{{ student.website }}" target="_blank">{{ student.name }}</a>{% else %}{{ student.name }}{% endif %}</td>
<td>{{ student.title }}</td>
<td>{{ student.university }}</td>
<td>{{ student.advisor }}</td>
</tr>
{% endfor %}
</tbody>
</table>
</div>
{% endif %}

{% if graduated_thesis.size > 0 %}
#### Completed

<div class="table-responsive">
<table class="table">
<thead>
<tr>
<th>Student</th>
<th>Title</th>
<th>University</th>
<th>Advisor</th>
<th>Year</th>
</tr>
</thead>
<tbody>
{% for student in graduated_thesis %}
<tr>
<td>{% if student.website %}<a href="{{ student.website }}" target="_blank">{{ student.name }}</a>{% else %}{{ student.name }}{% endif %}</td>
<td>{{ student.title }}</td>
<td>{{ student.university }}</td>
<td>{{ student.advisor }}</td>
<td>{{ student.graduation_year }}</td>
</tr>
{% endfor %}
</tbody>
</table>
</div>
{% endif %}

</div>
{% endif %}

{% if site.data.advising.current_advisees.size == 0 and site.data.advising.graduated_advisees.size == 0 and site.data.advising.dissertation_committee.size == 0 and site.data.advising.thesis_committee.size == 0 %}
<div class="jumbotron">
<p><em>Advising information coming soon.</em></p>
</div>
{% endif %}
