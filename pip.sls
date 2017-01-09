python-pip:
  pkg:
    - installed

virtualenvwrapper:
  pip.installed:
    - require:
      - pkg: python-pip

flask:
  pip.installed:
    - name: flask == 0.11
    - reload_modules: True
    - require:
      - pkg: python-pip

gunicorn:
  pip.installed:
    - name: gunicorn
    - reload_modules: True
    - require:
      - pkg: python-pip