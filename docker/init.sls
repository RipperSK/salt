docker_prereq:
  pkg.latest:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - curl
      - gnupg
      - lsb-release
add_docker_key:
  cmd.run:
    - name: curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
docker_repo:
  pkgrepo.managed:
    - name: deb [arch=amd64] https://download.docker.com/linux/debian buster stable
    - file: /etc/apt/sources.list.d/docker.list
    - refresh_db: true
refresh_apt:
  cmd.run:
    - name: apt update
docker_packages:
  pkg.latest:
    - pkgs:
      - docker-ce
      - docker-ce-cli
      - containerd.io
