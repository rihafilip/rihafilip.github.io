---
layout: default
title: CV
permalink: /cv/
---

# CV

[Download PDF]({{ '/files/cv.pdf' | relative_url }})

## Education
{% for e in site.data.cv.education %}
**{{ e.degree }}** <span class="cv-meta">({{ e.years }})</span>  
<span class="cv-meta">{{ e.institution }}</span>  
{% if e.note %}{{ e.note }}{% endif %}
{% endfor %}

## Research
{% for r in site.data.cv.research %}
**[{{ r.group }}]({{ r.url }})** <span class="cv-meta">({{ r.years }})</span>
{% for i in r.items %}
- {{ i }}
{%- endfor %}
{% endfor %}

## Publications and Talks
{% include pub-years.html %}
{% for year in pub_years %}{% for entry in year.items %}{% assign p = entry[1] %}
- {{ p.authors | join: ", " }} ({{ p.info.year }}). [*{{ p.title }}*]({{ '/publications/' | relative_url | append: '#' | append: entry[0] }}).{% if p.info.venue %} {{ p.info.venue }}.{% endif %}{% if p.info.type == "Talk" %} Talk.{% endif %}
{% endfor %}{% endfor %}

## Teaching
{% for t in site.data.cv.teaching %}
**{{ t.subject }}** <span class="cv-meta">({{ t.years }})</span>  
{{ t.note }}
{% endfor %}

## Thesis Supervision
{% for t in site.data.cv.thesis_supervision %}
**[{{ t.title }}]({{ t.link }}) ({{ t.level }} thesis)** <span class="cv-meta">({{ t.year }})</span>  
{{ t.student }}
{% endfor %}

## Other Activities
{% for s in site.data.cv.other %}
- {{ s.role }}, {{ s.event }}
{% endfor %}
