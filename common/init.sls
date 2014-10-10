# vim: sts=2 ts=2 sw=2 et ai

{% for section in salt['pillar.get']('common', {}).items() %}
{% if section == 'includes' %}
{% for include in section.items() %}
include:
{% if include %}
  {{ include }}
{% endif %}
{% endfor %}
{% else %}
{% for groups, packages in section.items() %}
{% for package in packages %}
{% if package %}
{{ package }}:
  pkg.installed
{% endif %}
{% endfor %} {# packages #}
{% endfor %} {# groups #}
{% endif %}
{% endfor %} {# sections #}

