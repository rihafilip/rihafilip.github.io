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
{% include pub-years.html %}
{% for year in pub_years %}{% for entry in site.data.publications %}{% assign p = entry[1] %}{% if p.info.year == year %}
- {{ p.authors | join: ", " }} ({{ p.info.year }}). [*{{ p.title }}*]({{ '/publications/' | relative_url | append: '#' | append: entry[0] }}).{% if p.info.venue %} {{ p.info.venue }}.{% endif %}{% if p.info.type == "Talk" %} Talk.{% endif %}
{% endif %}{% endfor %}{% endfor %}

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
