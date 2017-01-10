hello_app:
  git.latest:
    - name: https://github.com/Srendi/LumiFlaskBlog.git
    - target: /var/www

run_app:
  cmd.run:
    - cd /var/www/LumiFlaskBlog/ && sudo gunicorn -w 4 -b 127.0.0.1:8000 $usedApp &
    - sudo service nginx reload