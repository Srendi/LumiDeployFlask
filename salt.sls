salt-minion:
  pkg:
    - installed
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: salt-minion
      - file: /etc/salt/minion.d/minion.conf

/etc/salt/minion.d/minion.conf:
  file.copy:
    - source: /srv/salt/LumiDeployFlask/salt/files/etc/salt/minion.d/minion.conf
    - force: True
    - user: root
    - group: root
    - mode: 640