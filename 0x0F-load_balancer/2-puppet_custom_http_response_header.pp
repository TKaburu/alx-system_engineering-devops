#  Install Nginx with puppet and add custon header

# Update and install nginx
exec { 'update':
  command => 'apt-get update',
}

package { 'install nginx':
  ensure     => 'installed',
}

# Handle custom_header
file_line { 'custom header':
  ensure => present,
  path   => '/etc/nginx/sites-enabled/default',
  after  => 'server_name _;',
  line   => 'add_header X-Served-By $hostname;',
}

# start nginx
service { 'run nginx':
  ensure  => running,
  require => Package['nginx'],
}