#  Install Nginx with puppet and add custon header

# Update and install nginx
exec { 'update':
  command => '/usr/bin/apt-get update',

}

package { 'nginx':
  ensure => 'installed',
  require => Exec['update'],
}

# Handle custom_header
file_line { 'custom header':
  ensure => present,
  path   => '/etc/nginx/sites-enabled/default',
  after  => 'server_name _;',
  line   => 'add_header X-Served-By \$hostname;',
  require => Package['nginx'],
}

# start nginx
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
