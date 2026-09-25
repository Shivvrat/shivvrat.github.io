---
title: "About"
layout: about
sitemap: false
permalink: /about/
seo:
  title: "About – Shivvrat Arya"
  description: "Biography, research honors, professional recognition, and educational background of Shivvrat Arya, Assistant Professor of Computer Science at NJIT."
---

<div class="section-card awards-section">
  <h2>Awards & Honors</h2>
  {% assign research_awards = site.data.awards | where: "group", "research" %}
  {% assign professional_awards = site.data.awards | where: "group", "professional" %}
  {% assign earlier_honors = site.data.awards | where: "group", "earlier_honors" %}
  {% include award-list.html awards=research_awards heading="Research Recognition" %}
  {% include award-list.html awards=professional_awards heading="Professional Recognition" %}
  {% include award-list.html awards=earlier_honors heading="Educational Recognition" %}
</div>
