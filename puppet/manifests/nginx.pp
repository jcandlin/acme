group { 'puppet':
    ensure => present,
}

exec { 'apt-get update': 
    command => '/usr/bin/apt-get update',
}

package { 'nginx': 
    ensure => present,
    require => Exec['apt-get update'],
}

service { 'nginx':
    ensure => running,
    require => Package['nginx'],
}

file { 'vagrant-nginx':
    path => '/etc/nginx/sites-available/default',
    ensure => file,
    replace => true,
    require => Package['nginx'],
    source => 'puppet:///modules/nginx/default',
    notify => Service['nginx'],
}

file { 'default-nginx-disable':
    path => '/etc/nginx/sites-enabled/default',
    ensure => absent,
    require => Package['nginx'],
}

#file { 'vagrant-nginx-enable':
#    path => '/etc/nginx/sites-enabled/default',
#    target => '/etc/nginx/sites-available/default',
#    ensure => link,
#    notify => Service['nginx'],
#    require => [
#        File['vagrant-nginx'],
#        File['default-nginx-disable'],
#    ],
#}
