{#
# vim: sts=2 ts=2 sw=2 et ai
#}
{% if salt['pillar.get']('common:includes', {}) %}
include:
{% for include in salt['pillar.get']('common:includes', {}) %}
  - {{ include }}
{% endfor %}
{% endif %}
{% for groups, packages in salt['pillar.get']('common:packages', {}).items() %}
{% set counter = loop.index0 %}
{% for package in packages %}
common--{{ counter }}-{{ loop.index0 }}:
  pkg.installed:
    - name: {{ package }}
{% endfor %} {# packages #}
{% endfor %} {# groups #}

