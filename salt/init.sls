salt-master:
  pkg:
    - installed
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: salt-master
      - file: /etc/salt/master
	  
salt-minion:
  pkg:
    - installed
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: salt-minion
      - file: /etc/salt/minion
	  
/etc/salt/master:
 file.managed:
    - source: salt://salt/files/etc/salt/master
    - user: root
    - group: root
    - mode: 640
	
/etc/salt/minion:
 file.managed:
    - source: salt://salt/files/etc/salt/minion
    - user: root
    - group: root
    - mode: 640