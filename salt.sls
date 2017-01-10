directories:
   file.directory:
     - user: root
     - group: root
     - mode: 755
     - makedirs: True
    - names:
      - /srv/salt
      - /srv/pillar
      - /srv/formulas
      - /srv/salt/prod
      - /srv/salt/dev
      - /srv/salt/qa
      - /etc/salt/master.d/
      - /etc/salt/minion.d/

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
      - file: /etc/salt/minion.d/minion.conf

openfirewall:
  cmd.run:
    - ufw allow salt

lumiDeployFlask:
  git.latest:
    - name: https://github.com/Srendi/LumiDeployFlask.git
    - target: /srv/salt

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