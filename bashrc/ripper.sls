/home/ripper/.bashrc:
  file.managed:
    - user: ripper
    - group: ripper
    - mode: 0644
    - source: salt://bashrc/bashrc-ripper
