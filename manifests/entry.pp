# Define: sudo::entry
#
# This define is used to add new entries to sudo
#
# Parameters:
#   $filename:
#       File name to be used when storing this entry to /etc/sudoers.d
#       The number defining the order will be prefixed to this name
#   $order:
#       Default: 50
#       Order in wich sudo will execute this entry
#
define sudo::entry (
    $filename = '',
    $order = '50'
) {

    $md5 = md5($name)

    $my_filename = $filename ? {
        ""      => "sudoers_$md5",
        default => $filename,
    }

    file { "/etc/sudoers.d/${order}_$my_filename":
        content => "$name\n",
        owner   => 'root',
        group   => 'root',
        mode    => '0440',
        require => File['/etc/sudoers.d'],
    }
}
