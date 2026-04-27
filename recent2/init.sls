install_pip3:
  pkg.latest:
    - pkgs:
      - python3-pip
install_recent2:
  pip.installed:
    - name: recent2
  file.managed:
    - name: /etc/profile.d/recent2.sh
    - user: root
    - group: root
    - mode: 0644
    - source: salt://recent2/recent2.sh
