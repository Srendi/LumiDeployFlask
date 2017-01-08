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
    - require:
      - pkg: python-pip

gunicorn:
  pip.installed:
    - name: gunicorn
    - require:
      - pkg: python-pip