---
title: "Certifications"
layout: gridlay
sitemap: false
permalink: /certifications/
---

<link rel="stylesheet" href="{{ '/assets/css/responsive.css' | relative_url }}">

<div class="section-card">

## Certifications and Professional Development

{% assign certifications_by_provider = site.data.certifications | group_by: "provider" %}
{% for provider_group in certifications_by_provider %}
<div class="subsection-card">

### {{ provider_group.name }}

{% for item in provider_group.items %}
- {% if item.url %}{% if item.url contains "://" %}<a href="{{ item.url }}" target="_blank">{{ item.title }}</a>{% else %}<a href="{{ item.url | relative_url }}" target="_blank">{{ item.title }}</a>{% endif %}{% else %}{{ item.title }}{% endif %}{% if item.date %} ({{ item.date | date: "%Y" }}){% endif %}{% assign credential_id = item.credential_id | strip %}{% if credential_id != "" %}<br><small>Credential ID: {{ credential_id }}</small>{% endif %}{% assign summary = item.summary | strip %}{% if summary != "" %}<br><small>{{ summary }}</small>{% endif %}
{% endfor %}

</div>
{% endfor %}

{% if site.data.certifications.size == 0 %}
<p><em>Certification information coming soon.</em></p>
{% endif %}

</div>
