{%- from 'java/settings.sls' import java with context %}

curl:
  pkg.installed: []

java_prefix_folder:
  file.directory:
    - name: {{ java.prefix }}
    - mode: 755
    - user: root
    - group: root

jdk_tarball:
  cmd.run:
    - name: curl {{ java.dl_opts }} '{{ java.source_url }}' | tar xz --no-same-owner
    - cwd: {{ java.prefix }}
    - unless: test -d {{ java.java_home }}
    - require:
      - pkg: curl

jdk_intall_alternatives:
  alternatives.install:
    - name: java
    - link: /usr/bin/java
    - path: {{ java.java_home }}/bin/java
    - priority: 2000
    - require:
      - cmd: jdk_tarball

jdk_set_alternatives:
  alternatives.set:
    - name: java
    - path: {{ java.java_home }}/bin/java

jdk_profile:
  file.managed:
    - name: /etc/profile.d/java.sh
    - source: salt://java/files/java.sh
    - template: jinja
    - mode: 644
    - user: root
    - group: root
    - context:
      java_home: {{ java.java_home }}
