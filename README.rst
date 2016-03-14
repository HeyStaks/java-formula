============
java-formula
============

Formula to set up and configure Java JREs and JDKs from a tarball archive sourced via URL.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.
    
Available states
================

.. contents::
    :local:

``java``
------------

- Downloads the tarball from the java:source_url configured as either a pillar or grain and will not do anything if source_url is omitted. 
- Unpacks the archive into java:prefix (defaults to /usr/lib/java).
- Use the alternatives system to link the installation to java_home. Please see the pillar.example for configuration.

Tested on Ubuntu 14.04 (LTS)
