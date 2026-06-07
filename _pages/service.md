---
title: "Service"
layout: gridlay
sitemap: false
permalink: /service/
---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">

<div class="section-card">

## Professional Service

{% assign journal_service = site.data.academic_service | where: "section", "Journal Reviewer" %}
{% assign conference_service = site.data.academic_service | where: "section", "Conference Reviewer" %}

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

{% if site.data.academic_service.size == 0 %}
<p><em>Service information coming soon.</em></p>
{% endif %}

</div>

<div class="section-card">

## Organizational Service

{% assign organizational_by_section = site.data.organizational_responsibilities | group_by: "section" %}
{% for section_group in organizational_by_section %}
<div class="subsection-card">

### {{ section_group.name }}

{% for item in section_group.items %}
- <strong>{{ item.role }}:</strong> {{ item.display }}
{% assign context = item.context | strip %}{% if context != "" %}<br><small>{{ context }}</small>{% endif %}
{% assign summary = item.summary | strip %}{% if summary != "" %}<br><small>{{ summary }}</small>{% endif %}
{% endfor %}

</div>
{% endfor %}

{% if site.data.organizational_responsibilities.size == 0 %}
<p><em>Organizational service information coming soon.</em></p>
{% endif %}

</div>
