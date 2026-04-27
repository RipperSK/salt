/etc/resolv.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
{% if grains['host'] == 'pihole' %}
    - source: salt://resolvconf/resolv.conf-pihole
{% else %}
    - source: salt://resolvconf/resolv.conf
{% endif %}
