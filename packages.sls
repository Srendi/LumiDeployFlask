python-pip:
  pkg:
    - installed
    - allow_updates: True

python-software-properties:
  pkg:
    - installed
    - allow_updates: True

software-properties-common:
  pkg:
    - installed
    - allow_updates: True

pkgrepo.managed:
  - ppa: fkrull/deadsnakes-python2.7
pkg.latest:
  - name: deadsnakes-python2.7
  - refresh: True

python2.7:
  pkg:
    - installed
    - allow_updates: True

msgpack-python:
  pkg:
    - installed
    - allow_updates: True

python-crypto:
  pkg:
    - installed
    - allow_updates: True

git:
  pkg:
    - installed
    - allow_updates: True

python-virtualenv:
  pkg:
    - installed
    - allow_updates: True
