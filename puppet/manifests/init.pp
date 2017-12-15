exec { 'apt-get update':
  path => '/usr/bin',
}

package { 'vim':
  ensure => present,
}

file { '/var/www/':
  ensure => 'directory',
}

  host { 'lb01':
    ip => '10.11.12.50',
  }
include nginx
