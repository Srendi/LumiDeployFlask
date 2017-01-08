python-pip:
  pkg:
    - installed
      - exists_action: i

virtualenvwrapper:
  pip.installed:
    - exists_action: i
    - require:
      - pkg: python-pip

flask:
  pip.installed:
    - name: flask == 0.11
    - reload_modules: True
    - exists_action: i
    - require:
      - pkg: python-pip

gunicorn:
  pip.installed:
    - name: gunicorn
    - reload_modules: True
    - exists_action: i
    - require:
      - pkg: python-pip