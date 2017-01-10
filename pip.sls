python-pip:
  pkg:
    - installed

virtualenv:
  pip.installed:
    - name: virtualenv
    - reload_modules: True
    - require:
      - pkg: python-pip

virtualenvwrapper:
  pip.installed:
    - require:
      - pkg: python-pip

Werkzeug:
  pip.installed:
    - name: Werkzeug
    - reload_modules: True
    - require:
      - pkg: python-pip

Jinja2:
  pip.installed:
    - name: Jinja2
    - reload_modules: True
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
