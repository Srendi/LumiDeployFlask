nginx:
  pkg:
    - installed
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: nginx
      - file: /etc/nginx/conf.d/nginx.conf
      - file: /etc/nginx/sites-available/hello.conf

/var/www:
   file.directory:
     - user: root
     - group: root
     - mode: 755

/etc/nginx/conf.d/:
   file.directory:
     - user: root
     - group: root
     - mode: 755

/etc/nginx/conf.d/nginx.conf:
  file.copy:
    - source: /srv/salt/LumiDeployFlask/nginx/files/etc/nginx/conf.d/nginx.conf
    - force: True
    - user: root
    - group: root
    - mode: 640

/etc/nginx/sites-available/hello.conf:
  file.copy:
    - source: /srv/salt/LumiDeployFlask/nginx/files/etc/nginx/sites-available/hello.conf
    - force: True
    - user: root
    - group: root
    - mode: 640

/etc/nginx/sites-enabled/hello:
  file.symlink:
    - target: /etc/nginx/sites-available/hello.conf
    - require:
      - file: /etc/nginx/sites-available/hello.conf