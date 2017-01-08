nginx:
  pkg:
    - installed
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: nginx
      - file: /etc/nginx/conf.d/nginx.conf
      - file: /etc/nginx/sites-available/default

/etc/nginx/conf.d/nginx.conf:
  file.managed:
    - source: salt://nginx/files/etc/nginx/conf.d/nginx.conf
    - user: root
    - group: root
    - mode: 640

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://nginx/files/etc/nginx/sites-available/default.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 640

/etc/nginx/sites-enabled/default:
  file.symlink:
    - target: /etc/nginx/sites-available/default
    - require:
      - file: /etc/nginx/sites-available/default