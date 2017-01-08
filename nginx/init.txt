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
    - source: salt://nginx/files/etc/nginx/conf.d/nginx.conf
    - user: root
    - group: root
    - mode: 640