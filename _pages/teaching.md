---
title: "Teaching"
layout: gridlay
sitemap: false
permalink: /teaching/
---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">

<div class="section-card">

## Academic Teaching Experience

{% assign teaching_by_institution = site.data.academic_teaching | group_by: "institution" %}
{% for institution_group in teaching_by_institution %}
{% assign teaching_by_role = institution_group.items | group_by: "role" %}
{% for role_group in teaching_by_role %}
<div class="subsection-card">

### At {{ institution_group.name }}{% if role_group.name %} -- {{ role_group.name }}{% endif %}

<div class="table-responsive">
<table class="teaching-table">
  <thead>
    <tr>
      <th>Year/Term</th>
      <th>Course No.</th>
      <th>Course</th>
      <th>Level</th>
      <th>Department</th>
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
