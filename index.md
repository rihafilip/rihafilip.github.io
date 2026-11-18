---
layout: default
title: About
---

I'm a PhD student at the [Programming Research Laboratory](https://prl-prg.github.io/)
at the Faculty of Information Technology, Czech Technical University in Prague.

## Recent publications

{% assign recent = site.data.publications | sort: "year" | reverse %}
{% for p in recent limit: 3 %}
- [{{ p.title }}]({{ '/publications/' | relative_url | append: '#' | append: p.slug }}), {{ p.venue }}
{% endfor %}

[All publications →]({{ '/publications/' | relative_url }})
