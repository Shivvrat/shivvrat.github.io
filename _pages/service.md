---
title: "Service"
layout: gridlay
sitemap: false
permalink: /service/
---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">

{% assign journal_service = site.data.academic_service | where: "section", "Journal Reviewer" %}
{% assign conference_service = site.data.academic_service | where: "section", "Conference Reviewer" %}

<div class="section-card">

## Professional Service

{% if journal_service.size > 0 %}
<div class="subsection-card">

### Journals

{% for item in journal_service %}
- {{ item.display }}
{% endfor %}

</div>
{% endif %}

{% if conference_service.size > 0 %}
<div class="subsection-card">

### Conferences

{% for item in conference_service %}
- {{ item.display }}
{% endfor %}

</div>
{% endif %}

{% if journal_service.size == 0 and conference_service.size == 0 %}
<p><em>Professional service information coming soon.</em></p>
{% endif %}

</div>

{% assign student_service = site.data.organizational_responsibilities | where: "scope", "student" %}
{% assign community_service = site.data.organizational_responsibilities | where: "scope", "community" %}
{% assign grouped_organizational = site.data.organizational_responsibilities | where_exp: "item", "item.scope == 'department' or item.scope == 'university'" %}

{% if grouped_organizational.size > 0 %}
<div class="section-card">

## University Service

{% assign institutions = grouped_organizational | group_by: "institution" %}
{% for institution in institutions %}
{% assign institution_items = grouped_organizational | where: "institution", institution.name %}
### {{ institution.name }}

{% assign department_service = institution_items | where: "scope", "department" %}
{% if department_service.size > 0 %}
<div class="subsection-card">

#### Department Service

{% for item in department_service %}
- <strong>{{ item.role }}:</strong> {{ item.display }}{% assign summary = item.summary | strip %}{% if summary != "" %}<br><small>{{ summary }}</small>{% endif %}
{% endfor %}

</div>
{% endif %}

{% assign university_service = institution_items | where: "scope", "university" %}
{% if university_service.size > 0 %}
<div class="subsection-card">

#### University Service

{% for item in university_service %}
- <strong>{{ item.role }}:</strong> {{ item.display }}{% assign summary = item.summary | strip %}{% if summary != "" %}<br><small>{{ summary }}</small>{% endif %}
{% endfor %}

</div>
{% endif %}

{% endfor %}

</div>
{% endif %}

{% if student_service.size > 0 %}
<div class="section-card">

## Student Leadership and Service

{% assign student_institutions = student_service | group_by: "institution" %}
{% for institution in student_institutions %}
### {{ institution.name }}

<div class="subsection-card">
{% for item in institution.items %}
- <strong>{{ item.role }}:</strong> {{ item.display }}
{% endfor %}
</div>
{% endfor %}

</div>
{% endif %}

{% if community_service.size > 0 %}
<div class="section-card">

## Community Service

<div class="subsection-card">
{% for item in community_service %}
- <strong>{{ item.role }}:</strong> {{ item.display }}{% assign context = item.context | strip %}{% if context != "" %}<br><small>{{ context }}</small>{% endif %}
{% endfor %}
</div>

</div>
{% endif %}
