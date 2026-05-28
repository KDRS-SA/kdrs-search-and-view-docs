---
layout: default
title: Templates
nav_order: 1
has_children: false
---

# Community Templates
{: .no_toc }
Built by KDRS and members.
Browse the collection below, or [build your own]({{ 'guides' | relative_url }}).
{: .fs-6 .fw-300 }

{% assign hidden_slugs = "" %}
{% for item in site.data.templates_override %}
  {% if item[1].hidden %}
    {% assign hidden_slugs = hidden_slugs | append: "," | append: item[0] | append: "," %}
  {% endif %}
{% endfor %}

{% assign vendor_acc = "" %}
{% for pair in site.data.templates %}
  {% assign slug_check = "," | append: pair[0] | append: "," %}
  {% unless hidden_slugs contains slug_check %}
    {% assign base = pair[1].vendor | split: " (" | first %}
    {% assign vendor_acc = vendor_acc | append: base | append: "||" %}
  {% endunless %}
{% endfor %}
{% assign vendor_names = vendor_acc | split: "||" | uniq %}
{% assign vendor_list = vendor_names | where_exp: "v", "v != ''" %}

{% assign template_count = 0 %}
{% for pair in site.data.templates %}
  {% assign slug_check = "," | append: pair[0] | append: "," %}
  {% unless hidden_slugs contains slug_check %}
    {% assign template_count = template_count | plus: 1 %}
  {% endunless %}
{% endfor %}

<div class="tpl-stats">
  <div class="tpl-stat"><span class="tpl-stat-num">{{ template_count }}</span>templates</div>
  <div class="tpl-stat"><span class="tpl-stat-num">{{ vendor_list | size }}</span>vendors</div>
</div>

{% assign ranked = "" %}
{% for vendor in vendor_list %}
  {% assign count = 0 %}
  {% for pair in site.data.templates %}
    {% assign slug_check = "," | append: pair[0] | append: "," %}
    {% unless hidden_slugs contains slug_check %}
      {% assign base = pair[1].vendor | split: " (" | first %}
      {% if base == vendor %}{% assign count = count | plus: 1 %}{% endif %}
    {% endunless %}
  {% endfor %}
  {% if count < 10 %}
    {% assign padded = "0" | append: count %}
  {% else %}
    {% assign padded = count %}
  {% endif %}
  {% assign ranked = ranked | append: padded | append: "~" | append: vendor | append: "||" %}
{% endfor %}
{% assign vendors_ranked = ranked | split: "||" | sort | reverse %}

{% for entry in vendors_ranked %}
  {% unless entry == "" %}
    {% assign vendor = entry | split: "~" | last %}
    {% assign slugs = "" %}
    {% for pair in site.data.templates %}
      {% assign slug_check = "," | append: pair[0] | append: "," %}
      {% unless hidden_slugs contains slug_check %}
        {% assign base = pair[1].vendor | split: " (" | first %}
        {% if base == vendor %}{% assign slugs = slugs | append: pair[0] | append: "," %}{% endif %}
      {% endunless %}
    {% endfor %}
    {% assign slug_list = slugs | split: "," %}
<h3 class="tpl-vendor" id="{{ vendor | downcase | replace: ' ', '-' }}">{{ vendor }}</h3>
<div class="tpl-grid">
    {% for slug in slug_list %}
      {% assign t = site.data.templates[slug] %}
      {% assign meta = site.data.templates_override[slug] %}
      {% if t %}
<h6 class="tpl-anchor" id="{{ slug }}">{{ t.name }}</h6>
<div class="tpl-card">{{ t.name }}{% if meta.new %} <span class="tpl-new">ny</span>{% endif %}</div>
      {% endif %}
    {% endfor %}
</div>
  {% endunless %}
{% endfor %}

---

KDRS can help configure a template as part of your membership. We also arrange courses to get you up to speed.
Not a member? [Contact us](mailto:hjelp@kdrs.no)
