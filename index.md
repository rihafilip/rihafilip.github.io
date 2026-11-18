---
layout: default
title: About
---

I'm a PhD student at the [Programming Research Laboratory](https://prl-prg.github.io/)
at the Faculty of Information Technology, Czech Technical University in Prague.

## Recent publications

{% include pub-years.html %}
{% assign shown = 0 %}
{% for year in pub_years %}{% for entry in site.data.publications %}{% assign p = entry[1] %}{% if p.info.year == year and shown < 3 %}{% assign shown = shown | plus: 1 %}
- [{{ p.title }}]({{ '/publications/' | relative_url | append: '#' | append: entry[0] }}){% if p.info.venue %}, {{ p.info.venue }}{% endif %}
{% endif %}{% endfor %}{% endfor %}

[All publications →]({{ '/publications/' | relative_url }})
