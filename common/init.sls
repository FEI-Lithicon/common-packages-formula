# vim: sts=2 ts=2 sw=2 et ai

{% for groups, packages in salt['pillar.get']('packages', {}).items() %}
{% for package in packages %}
{% if package %}
{{ package }}:
  pkg.installed
{% endif %}
{% endfor %}
{% endfor %}

