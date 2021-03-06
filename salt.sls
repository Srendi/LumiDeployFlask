/srv/salt/:
   file.directory:
     - user: root
     - group: root
     - mode: 755
     - makedirs: True

/srv/pillar/:
   file.directory:
     - user: root
     - group: root
     - mode: 755
     - makedirs: True


/srv/formulas/:
   file.directory:
     - user: root
     - group: root
     - mode: 755
     - makedirs: True

/srv/salt/prod/:
   file.directory:
     - user: root
     - group: root
     - mode: 755
     - makedirs: True

/srv/salt/dev/:
   file.directory:
     - user: root
     - group: root
     - mode: 755
     - makedirs: True

/srv/salt/qa/:
   file.directory:
     - user: root
     - group: root
     - mode: 755
     - makedirs: True

/etc/salt/master.d/:
   file.directory:
     - user: root
     - group: root
     - mode: 755
     - makedirs: True

/etc/salt/minion.d/:
   file.directory:
     - user: root
     - group: root
     - mode: 755
     - makedirs: True

add-repo-salt:
  pkgrepo.managed:
    - ppa: saltstack/salt
  pkg.latest:
    - name: salt
    - refresh: True

salt-minion:
  pkg:
    - installed
    - allow_updates: True
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: salt-minion


ufw allow salt:
  cmd.run

lumiDeployFlask:
  git.latest:
    - name: https://github.com/Srendi/LumiDeployFlask.git
    - target: /srv/salt/LumiDeployFlask/

salt-ssh:
  pkg:
    - installed
    - allow_updates: True

salt-cloud:
  pkg:
    - installed
    - allow_updates: True

salt-doc:
  pkg:
    - installed
    - allow_updates: True

/etc/salt/minion.d/minion.conf:
  file.copy:
    - source: /srv/salt/LumiDeployFlask/salt/files/etc/salt/minion.d/minion.conf
    - force: True
    - user: root
    - group: root
    - mode: 640