{%- if grains.os_family == 'Debian' %}
refresh-pkgs:
  cmd.run:
    - name: apt-get update && apt-get -y upgrade && apt-get -y autoremove
{%- elif grains.os_family == 'RedHat' %}
refresh-pkgs:
  cmd.run:
    - name: dnf -y update
{%- endif %}
