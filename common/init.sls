{#
# vim: sts=2 ts=2 sw=2 et ai
#}
{% if salt['pillar.get']('common:includes', {}) %}
include:
{% for include in salt['pillar.get']('common:includes', {}) %}
  - {{ include }}
{% endfor %}
{% endif %}

{% if salt['pillar.get']('common:removed', {}) %}
common-removed:
  pkg.removed:
    - pkgs:
{% for package in salt['pillar.get']('common:removed', {}) %}
      - {{ package }}
{% endfor %}
{% endif %}

{% if salt['pillar.get']('common:held', {}) %}
{% for package in salt['pillar.get']('common:held', {}) %}
common-held-{{ package }}:
  pkg.installed:
    - name: {{ package }}
    - hold: True
{% endfor %}
{% endif %}


{% for groups, packages in salt['pillar.get']('common:packages', {}).items() %}
common-packages-{{ groups }}:
  pkg.installed:
    - pkgs:
{% for package in packages %}
      - {{ package }}
{% endfor %} {# packages #}
{% endfor %} {# groups #}
