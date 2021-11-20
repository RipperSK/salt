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
    - password: $6$NYpIMdhYp4OQW7Lt$heKDu24J7n1Rg7vA3oui6PG4TLRzOoPDIwlw/8BlmVxC.96N571fGWAJyFrlTTJbG85K/6Ruh4250kmuRSHM61
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
