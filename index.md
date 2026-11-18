---
layout: default
title: About
---

I'm a PhD student at the [Programming Research Laboratory](https://prl-prg.github.io/)
at the Faculty of Information Technology, Czech Technical University in Prague.

## Recent publications

{% assign recent = site.data.publications | sort: "year" | reverse %}
{% for p in recent limit: 3 %}
- [{{ p.title }}]({{ '/publications/' | append: p.slug | append: '/' | relative_url }}), {{ p.venue }}
{% endfor %}

[All publications →]({{ '/publications/' | relative_url }})
