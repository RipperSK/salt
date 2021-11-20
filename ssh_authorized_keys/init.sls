/root/.ssh:
  file.directory:
    - user: root
    - group: root
    - mode: 0400
    - makedirs: true
/root/.ssh/authorized_keys:
  file.managed:
    - user: root
    - group: root
    - mode: 0400
    - source: salt://ssh_authorized_keys/keys
