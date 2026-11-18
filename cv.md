---
layout: page
title: CV
permalink: /cv/
---

[Download PDF]({{ '/files/cv.pdf' | relative_url }})

## Education
{% for e in site.data.cv.education %}
**{{ e.degree }}**, {{ e.institution }} <span class="cv-meta">({{ e.years }})</span>{% if e.note %}<br>{{ e.note }}{% endif %}
{% endfor %}

## Research
{% for r in site.data.cv.research %}
**[{{ r.group }}]({{ r.url }})** <span class="cv-meta">({{ r.years }})</span>
{% for i in r.items %}
- {{ i }}
{%- endfor %}
{% endfor %}

## Publications and talks
{% assign pubs = site.data.publications | sort: "year" | reverse %}
{% for p in pubs %}
- {{ p.authors | map: "name" | join: ", " }} ({{ p.year }}). [*{{ p.title }}*]({{ '/publications/' | relative_url | append: '#' | append: p.slug }}). {{ p.venue }}.{% if p.type == "Talk" %} Talk.{% endif %}
{% endfor %}

## Teaching
{% for t in site.data.cv.teaching %}
**{{ t.role }}**, {{ t.institution }} <span class="cv-meta">({{ t.years }})</span>{% if t.note %}<br>{{ t.note }}{% endif %}
{% endfor %}

## Service
{% for s in site.data.cv.service %}
- {{ s.role }}, {{ s.event }}
{% endfor %}

{% if site.data.cv.skills %}
## Skills
{{ site.data.cv.skills | join: " · " }}
{% endif %}
