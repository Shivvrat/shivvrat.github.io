---
title: "Teaching"
layout: gridlay
permalink: /teaching/
---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">
<link rel="stylesheet" href="{{ '/assets/css/teaching-advising.css' | relative_url }}">

<div class="academic-records" markdown="1">

<p class="records-intro">Courses, teaching experience, and teaching certificates.</p>

{% comment %}
  Current-semester card: offerings whose class dates (from arya-academic-data via
  _data/academic_teaching.yml) include the build date, padded 3 weeks before the
  first class and 2 weeks after the last (finals). Refreshes on every site build.
{% endcomment %}
{% assign now_s = site.time | date: "%s" | plus: 0 %}
{% assign current_courses = "" | split: "" %}
{% for course in site.data.academic_teaching %}
{% if course.first_class_date and course.first_class_date != "" and course.last_class_date != "" %}
{% assign start_s = course.first_class_date | date: "%s" | plus: 0 | minus: 1814400 %}
{% assign end_s = course.last_class_date | date: "%s" | plus: 0 | plus: 1209600 %}
{% if now_s >= start_s and now_s <= end_s %}{% assign current_courses = current_courses | push: course %}{% endif %}
{% endif %}
{% endfor %}
{% if current_courses.size > 0 %}
<div class="section-card">

## This Semester

{% for course in current_courses %}
<div class="subsection-card">

### {% if course.page_url != "" %}<a href="{{ course.page_url | relative_url }}">{{ course.course }}{% if course.section != "" %}.{{ course.section }}{% endif %}: {{ course.title }}</a>{% else %}{{ course.course }}{% if course.section != "" %}.{{ course.section }}{% endif %}: {{ course.title }}{% endif %}

<ul class="current-course">
  <li><strong>Term:</strong> {{ course.term }}</li>
  {% if course.meeting != "" %}<li><strong>Meets:</strong> {{ course.meeting }}{% if course.room != "" %} · {{ course.room }}{% endif %}</li>{% endif %}
  {% if course.office_hours != "" %}<li><strong>Office hours:</strong> {{ course.office_hours }}</li>{% endif %}
  {% if course.teaching_assistants.size > 0 %}<li><strong>Teaching assistant{% if course.teaching_assistants.size > 1 %}s{% endif %}:</strong> {% for ta in course.teaching_assistants %}{{ ta.name }}{% if ta.email != "" %} (<a href="mailto:{{ ta.email }}">{{ ta.email }}</a>){% endif %}{% unless forloop.last %}; {% endunless %}{% endfor %}</li>{% endif %}
  {% if course.syllabus_url != "" %}<li><a href="{{ course.syllabus_url | relative_url }}" target="_blank" rel="noopener">Syllabus (PDF)</a></li>{% endif %}
</ul>

</div>
{% endfor %}

</div>
{% endif %}

<div class="section-card">

## Academic Teaching Experience

{% assign teaching_by_institution = site.data.academic_teaching | group_by: "institution" %}
{% for institution_group in teaching_by_institution %}
{% assign teaching_by_role = institution_group.items | group_by: "role" %}
{% for role_group in teaching_by_role %}
<div class="subsection-card">

### {{ institution_group.name }}

{% if role_group.name %}<p class="records-role">{{ role_group.name }}</p>{% endif %}

<div class="table-responsive" tabindex="0" role="region" aria-label="Teaching records">
<table class="teaching-table">
  <thead>
    <tr>
      <th scope="col">Year/Term</th>
      <th scope="col">Course No.</th>
      <th scope="col">Course</th>
      <th scope="col">Level</th>
      <th scope="col">Department</th>
    </tr>
  </thead>
  <tbody>
    {% for course in role_group.items %}
    {% assign course_url = course.url | strip %}
    {% assign course_number = course.course | strip %}
    <tr>
      <td>{{ course.term }}</td>
      <td>{% if course_url != "" and course_number != "" %}<a href="{{ course_url | relative_url }}">{{ course_number }}</a>{% else %}{{ course_number }}{% endif %}</td>
      <td>{{ course.title }}</td>
      <td>{{ course.level }}</td>
      <td>{{ course.department }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>
</div>

</div>
{% endfor %}
{% endfor %}

{% if site.data.academic_teaching.size == 0 %}
<p><em>Teaching information coming soon.</em></p>
{% endif %}

{% assign teaching_certificates = site.data.certifications | where: "teaching_section", true %}
{% if teaching_certificates.size > 0 %}
<div class="subsection-card">

### Certificates

{% for certificate in teaching_certificates %}
<div class="certificate-entry">
  <span><strong>{{ certificate.title }}</strong>{% if certificate.provider %} — {{ certificate.provider }}{% endif %}</span>
  {% if certificate.url %}<a class="btn btn-primary btn-sm" href="{{ certificate.url | relative_url }}" target="_blank" rel="noopener">View Certificate</a>{% endif %}
</div>
{% endfor %}

</div>
{% endif %}

</div>

</div>
