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
  file.managed:
    - source: /srv/salt/LumiDeployFlask/nginx/files/etc/nginx/conf.d/nginx.conf
    - replace: True
    - user: root
    - group: root
    - mode: 640