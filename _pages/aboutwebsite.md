---
title: "About the website"
layout: textlay
excerpt: "About the website."
sitemap: false
permalink: /aboutwebsite.html
---

{% capture website_readme %}{% include README.md %}{% endcapture %}
{{ website_readme | remove_first: "# Shivvrat Arya's website" }}
