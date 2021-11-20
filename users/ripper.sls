ripper group:
  group.present:
    - name: ripper
    - gid: 1000
ripper:
  user.present:
    - shell: /bin/bash
    - home: /home/ripper
    - uid: 1000
    - gid: 1000
    - password: <redacted>
    - groups:
      - ripper
/home/ripper/.ssh:
  file.directory:
    - user: ripper
    - group: ripper
    - mode: 0700
/home/ripper/.ssh/authorized_keys:
  file.managed:
    - user: ripper
    - group: ripper
    - mode: 0600
    - source: salt://users/keys
