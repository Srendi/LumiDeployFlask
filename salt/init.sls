salt-master:
  pkg:
    - installed
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: salt-master
      - file: /etc/salt/master.d/master.conf

salt-minion:
  pkg:
    - installed
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: salt-minion
      - file: /etc/salt/minion.d/minion.conf

/etc/salt/master.d/master.conf:
  file.managed:
    - source: /srv/salt/LumiDeployFlask/salt/files/etc/salt/master.d/master.conf
    - replace: True
    - user: root
    - group: root
    - mode: 640

/etc/salt/minion.d/minion.conf:
  file.managed:
    - source: /srv/salt/LumiDeployFlask/salt/files/etc/salt/minion.d/minion.conf
    - replace: True
    - user: root
    - group: root
    - mode: 640