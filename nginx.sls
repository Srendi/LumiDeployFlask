nginx:
  pkg:
    - installed
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: nginx
      - file: /etc/nginx/conf.d/nginx.conf

/etc/nginx/conf.d/nginx.conf:
  file.copy:
    - source: /srv/salt/LumiDeployFlask/nginx/files/etc/nginx/conf.d/nginx.conf
    - force: True
    - user: root
    - group: root
    - mode: 640

/etc/nginx/sites-enabled/default:
  file.symlink:
    - target: /etc/nginx/sites-available/default
    - require:
      - file: /etc/nginx/sites-available/default