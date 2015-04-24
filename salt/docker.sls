docker-dependencies:
   pkg.installed:
    - pkgs:
      - iptables
      - ca-certificates
      - lxc

docker_repo:
    pkgrepo.managed:
      - repo: 'deb http://get.docker.com/ubuntu docker main'
      - file: '/etc/apt/sources.list.d/docker.list'
      - key_url: salt://docker.pgp
      - require_in:
          - pkg: lxc-docker

lxc-docker:
  pkg.installed:
    - version: "1.6.0"
    - require:
      - pkg: docker-dependencies

docker:
  service.running
