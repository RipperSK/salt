ripper-sudoers:
  file.managed:
    - name: /etc/sudoers.d/ripper
    - user: root
    - group: root
    - mode: 0600
    - source: salt://sudoers/ripper
