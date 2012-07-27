# Class: sudo
#
# This class configures the standard environment for sudo to be managed by puppet
#
# Actions:
#   Installs the default sudoers file and creates the directory /etc/sudoers.d where all the snippets will be loaded from
#
# Sample usage:
#   include sudo
#   sudo::entry { "%nobody  ALL= (root) NOPASSWD:/sbin/service httpd restart": }
#
class sudo {

    package { 'sudo':
        ensure => installed,
    }

    file {
        '/etc/sudoers':
            owner  => 'root',
            group  => 'root',
            mode   => '0440',
            source => 'puppet:///modules/sudo/sudoers',
            require => Package['sudo'];
        '/etc/sudoers.d':
            ensure  => directory,
            owner   => 'root',
            group   => 'root',
            purge   => true,
            recurse => true,
            force   => true,
            mode    => '0750',
    }

}
