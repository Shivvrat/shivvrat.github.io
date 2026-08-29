---
title: "Advising"
layout: gridlay
sitemap: false
permalink: /advising/
---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">

{% assign advising_levels = "PhD|MS|BS" | split: "|" %}
{% if site.data.advising.current_advisees.size > 0 %}
<div class="jumbotron">

## Research Group / Advisees

{% for level in advising_levels %}
{% assign level_advisees = site.data.advising.current_advisees | where: "level", level %}
{% if level_advisees.size > 0 %}
### {{ level }} Students

{% assign project_groups = level_advisees | group_by: "title" %}
<div class="table-responsive">
<table class="table advising-table">
<thead>
<tr>
<th style="width: 24%; white-space: normal; overflow-wrap: anywhere;">Project / Thesis</th>
<th>Student</th>
<th>Course(s)</th>
<th>University</th>
</tr>
</thead>
<tbody>
{% for project in project_groups %}
{% assign project_students = project.items %}
{% for student in project_students %}
<tr>
{% if forloop.first %}<td rowspan="{{ project_students.size }}" style="width: 24%; white-space: normal; overflow-wrap: anywhere;">{{ project.name }}</td>{% endif %}
<td>{% if student.website %}<a href="{{ student.website }}" target="_blank">{{ student.name }}</a>{% else %}{{ student.name }}{% endif %}</td>
<td>{% if student.courses.size > 0 %}{{ student.courses | join: "; " }}{% endif %}</td>
{% if forloop.first %}<td rowspan="{{ project_students.size }}">{{ student.university }}</td>{% endif %}
</tr>
{% endfor %}
{% endfor %}
</tbody>
</table>
</div>
{% endif %}
{% endfor %}

</div>
{% endif %}

{% if site.data.advising.graduated_advisees.size > 0 %}
<div class="jumbotron">

## Former Advisees

{% for level in advising_levels %}
{% assign level_advisees = site.data.advising.graduated_advisees | where: "level", level %}
{% if level_advisees.size > 0 %}
### {{ level }} Students

<div class="table-responsive">
<table class="table">
<thead>
<tr>
<th>Name</th>
<th>Degree</th>
<th>University</th>
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
<td>{{ student.university }}</td>
<td>{{ student.graduation_year }}</td>
<td>{{ student.thesis_title }}</td>
<td>{% if student.current_position %}{{ student.current_position }}{% else %}{{ student.first_position }}{% endif %}</td>
</tr>
{% endfor %}
</tbody>
</table>
</div>
{% endif %}
{% endfor %}

</div>
{% endif %}

{% if site.data.advising.dissertation_committee.size > 0 %}
<div class="jumbotron">

## Dissertation Committees

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

{% if site.data.advising.qualifying_exam_committee.size > 0 %}
<div class="jumbotron">

## Qualifying Examination Committees

<div class="table-responsive">
<table class="table">
<thead>
<tr>
<th>Student</th>
<th>Title</th>
<th>University</th>
<th>Advisor</th>
<th>Date</th>
</tr>
</thead>
<tbody>
{% for student in site.data.advising.qualifying_exam_committee %}
<tr>
<td>{% if student.website %}<a href="{{ student.website }}" target="_blank">{{ student.name }}</a>{% else %}{{ student.name }}{% endif %}</td>
<td>{{ student.title }}</td>
<td>{{ student.university }}</td>
<td>{{ student.advisor }}</td>
<td>{{ student.date }}</td>
</tr>
{% endfor %}
</tbody>
</table>
</div>

</div>
{% endif %}

{% if site.data.advising.thesis_committee.size > 0 %}
<div class="jumbotron">

## Thesis Committees

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

{% if site.data.advising.current_advisees.size == 0 and site.data.advising.graduated_advisees.size == 0 and site.data.advising.dissertation_committee.size == 0 and site.data.advising.qualifying_exam_committee.size == 0 and site.data.advising.thesis_committee.size == 0 %}
<div class="jumbotron">
<p><em>Advising information coming soon.</em></p>
</div>
{% endif %}
