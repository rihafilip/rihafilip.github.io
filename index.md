---
layout: default
title: About
---

I'm a PhD student at the [Programming Research Laboratory](https://prl-prg.github.io/)
at the Faculty of Information Technology, Czech Technical University in Prague.

Currently I am doing research on foreign-function interface in language virtual machines.
Essentially trying to bridge the barrier between the C-level builtin and library
functions into the world of its higher-level managed languages to help with safety, correctness
and performance of code.

## My favorite projects

### bench ([GitHub](https://github.com/PRL-PRG/bench))

A command-line tool and a Python framework for easing the pain of benchmarking.

### HaSOM ([GitHub](https://github.com/rihafilip/HaSOM))

A virtual machine for SOM (a dialect of Smalltalk) writen in Haskell as bachelor thesis.

## Recent publications

{% include pub-years.html %}
{% assign min_year = site.time | date: "%Y" | minus: 1 %}
{% for year in pub_years %}
{% if year.name < min_year %}{% break %}{% endif %}
{% for entry in year.items %}{% assign p = entry[1] %}
- **[{{ p.title }}]({{ '/publications/' | relative_url | append: '#' | append: entry[0] }})**
{% if p.info.venue %}, {{ p.info.venue }}{% endif %}
{% endfor %}{% endfor %}

[All publications →]({{ '/publications/' | relative_url }})
