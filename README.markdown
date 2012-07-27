Sudo puppet module
==================

Puppet module to manage sudo

This module manages all sudo configuration and it provides an easy way to add sudo rules from puppet

Usage
-----

First include the sudo class. It's necesary to configure the initial environment for the module to work.

Then you can create as many rules as you like:

<pre>
include sudo
sudo::entry { "%nobody  ALL= (root) NOPASSWD:/sbin/service httpd restart": }
</pre>

Authors
-------

* **Carles Amigo** <fr3nd at fr3nd dot net>

