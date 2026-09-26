---
title: "Advising"
layout: gridlay
sitemap: false
permalink: /advising/
seo:
  title: "Advising & Student Mentoring – Shivvrat Arya"
  description: "Student research mentoring, master's and undergraduate project advisement, and doctoral/thesis committee service by Shivvrat Arya at NJIT."
---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">
<link rel="stylesheet" href="{{ '/assets/css/teaching-advising.css' | relative_url }}">

<div class="academic-records" markdown="1">

<p class="records-intro">Student research mentoring and dissertation, qualifying examination, and thesis committee service.</p>

<nav class="records-nav" aria-label="Advising sections" markdown="0">
{% if site.data.advising.current_advisees.size > 0 %}<a href="#student-research-mentoring">Student Research Mentoring</a>{% endif %}
{% if site.data.advising.graduated_advisees.size > 0 %}<a href="#former-advisees">Former Advisees</a>{% endif %}
{% if site.data.advising.dissertation_committee.size > 0 %}<a href="#dissertation-committees">Dissertation Committees</a>{% endif %}
{% if site.data.advising.qualifying_exam_committee.size > 0 %}<a href="#qualifying-examination-committees">Qualifying Examination Committees</a>{% endif %}
{% if site.data.advising.thesis_committee.size > 0 %}<a href="#thesis-committees">Thesis Committees</a>{% endif %}
</nav>

{% assign advising_levels = "PhD|MS|BS" | split: "|" %}
{% if site.data.advising.current_advisees.size > 0 %}
<div class="section-card">

<h2 id="student-research-mentoring">Student Research Mentoring</h2>

{% for level in advising_levels %}
{% assign level_advisees = site.data.advising.current_advisees | where: "level", level %}
{% if level_advisees.size > 0 %}
### {{ level }} Students

{% assign project_groups = level_advisees | group_by: "title" %}
<div class="table-responsive" tabindex="0" role="region" aria-label="Advising records">
<table class="records-table advising-table">
<colgroup>
<col style="width: 34%;">
<col style="width: 20%;">
<col style="width: 32%;">
<col style="width: 14%;">
</colgroup>
<thead>
<tr>
<th scope="col">Project / Thesis</th>
<th scope="col">Student</th>
<th scope="col">Course(s)</th>
<th scope="col">University</th>
</tr>
</thead>
<tbody>
{% for project in project_groups %}
{% assign project_students = project.items %}
{% for student in project_students %}
<tr>
{% if forloop.first %}<td rowspan="{{ project_students.size }}">{% if project.name and project.name != "" %}{{ project.name }}{% else %}—{% endif %}</td>{% endif %}
<td>{% if student.website %}<a href="{{ student.website }}" target="_blank" rel="noopener">{{ student.name }}</a>{% else %}{{ student.name }}{% endif %}</td>
<td>{% if student.courses and student.courses.size > 0 %}{{ student.courses | join: "; " }}{% else %}—{% endif %}</td>
<td>{{ student.university | default: "NJIT" }}</td>
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
<div class="section-card">

<h2 id="former-advisees">Former Advisees</h2>

{% for level in advising_levels %}
{% assign level_advisees = site.data.advising.graduated_advisees | where: "level", level %}
{% if level_advisees.size > 0 %}
### {{ level }} Students

<div class="table-responsive" tabindex="0" role="region" aria-label="Advising records">
<table class="records-table">
<thead>
<tr>
<th scope="col">Name</th>
<th scope="col">Degree</th>
<th scope="col">University</th>
<th scope="col">Year</th>
<th scope="col">Thesis/Dissertation</th>
<th scope="col">Position</th>
</tr>
</thead>
<tbody>
{% for student in level_advisees %}
<tr>
<td>{% if student.website %}<a href="{{ student.website }}" target="_blank" rel="noopener">{{ student.name }}</a>{% else %}{{ student.name }}{% endif %}</td>
<td>{{ student.role }}</td>
<td>{{ student.university | default: "NJIT" }}</td>
<td>{{ student.graduation_year }}</td>
<td>{{ student.thesis_title | default: "—" }}</td>
<td>{% if student.current_position %}{{ student.current_position }}{% elsif student.first_position %}{{ student.first_position }}{% else %}—{% endif %}</td>
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
<div class="section-card">

<h2 id="dissertation-committees">Dissertation Committees</h2>

{% assign current_diss = site.data.advising.dissertation_committee | where: "status", "current" %}
{% assign graduated_diss = site.data.advising.dissertation_committee | where: "status", "graduated" %}

{% if current_diss.size > 0 %}
### Current

<div class="table-responsive" tabindex="0" role="region" aria-label="Advising records">
<table class="records-table">
<thead>
<tr>
<th scope="col">Student</th>
<th scope="col">Title</th>
<th scope="col">University</th>
<th scope="col">Advisor</th>
</tr>
</thead>
<tbody>
{% for student in current_diss %}
<tr>
<td>{% if student.website %}<a href="{{ student.website }}" target="_blank" rel="noopener">{{ student.name }}</a>{% else %}{{ student.name }}{% endif %}</td>
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
### Completed

<div class="table-responsive" tabindex="0" role="region" aria-label="Advising records">
<table class="records-table">
<thead>
<tr>
<th scope="col">Student</th>
<th scope="col">Title</th>
<th scope="col">University</th>
<th scope="col">Advisor</th>
<th scope="col">Year</th>
</tr>
</thead>
<tbody>
{% for student in graduated_diss %}
<tr>
<td>{% if student.website %}<a href="{{ student.website }}" target="_blank" rel="noopener">{{ student.name }}</a>{% else %}{{ student.name }}{% endif %}</td>
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
<div class="section-card">

<h2 id="qualifying-examination-committees">Qualifying Examination Committees</h2>

<div class="table-responsive" tabindex="0" role="region" aria-label="Advising records">
<table class="records-table">
<thead>
<tr>
<th scope="col">Student</th>
<th scope="col">Title</th>
<th scope="col">University</th>
<th scope="col">Advisor</th>
<th scope="col">Date</th>
</tr>
</thead>
<tbody>
{% for student in site.data.advising.qualifying_exam_committee %}
<tr>
<td>{% if student.website %}<a href="{{ student.website }}" target="_blank" rel="noopener">{{ student.name }}</a>{% else %}{{ student.name }}{% endif %}</td>
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
<div class="section-card">

<h2 id="thesis-committees">Thesis Committees</h2>

{% assign current_thesis = site.data.advising.thesis_committee | where: "status", "current" %}
{% assign graduated_thesis = site.data.advising.thesis_committee | where: "status", "graduated" %}

{% if current_thesis.size > 0 %}
### Current

<div class="table-responsive" tabindex="0" role="region" aria-label="Advising records">
<table class="records-table">
<thead>
<tr>
<th scope="col">Student</th>
<th scope="col">Title</th>
<th scope="col">University</th>
<th scope="col">Advisor</th>
</tr>
</thead>
<tbody>
{% for student in current_thesis %}
<tr>
<td>{% if student.website %}<a href="{{ student.website }}" target="_blank" rel="noopener">{{ student.name }}</a>{% else %}{{ student.name }}{% endif %}</td>
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
### Completed

<div class="table-responsive" tabindex="0" role="region" aria-label="Advising records">
<table class="records-table">
<thead>
<tr>
<th scope="col">Student</th>
<th scope="col">Title</th>
<th scope="col">University</th>
<th scope="col">Advisor</th>
<th scope="col">Year</th>
</tr>
</thead>
<tbody>
{% for student in graduated_thesis %}
<tr>
<td>{% if student.website %}<a href="{{ student.website }}" target="_blank" rel="noopener">{{ student.name }}</a>{% else %}{{ student.name }}{% endif %}</td>
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
<div class="section-card">
<p><em>Advising information coming soon.</em></p>
</div>
{% endif %}

</div>
