{% set version = '0.16.0' %}

acmed_archive:
  archive.extracted:
    - name: /opt/acmed-{{ version }}
    - source: https://github.com/chmodas/acmed-formula/releases/download/v{{ version }}/acmed.tar.gz
    - skip_verify: True
    - if_missing: /opt/acmed-{{ version }}

/etc/acmed:
  file.symlink:
    - target: /opt/acmed-{{ version }}/etc/acmed
    - require:
      - archive: acmed_archive

/usr/bin/acmed:
  file.symlink:
    - target: /opt/acmed-{{ version }}/usr/bin/acmed
    - require:
      - archive: acmed_archive

/usr/share/man/man5/acmed.toml.5.gz:
  file.symlink:
    - target: /opt/acmed-{{ version }}/usr/share/man/man5/acmed.toml.5.gz
    - require:
      - archive: acmed_archive

/usr/share/man/man8/acmed.8.gz:
  file.symlink:
    - target: /opt/acmed-{{ version }}/usr/share/man/man8/acmed.8.gz
    - require:
      - archive: acmed_archive

