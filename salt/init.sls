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