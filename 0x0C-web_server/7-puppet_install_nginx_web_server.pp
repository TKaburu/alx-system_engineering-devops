# setup nginx with puppet

exec { 'update system':
        command => '/usr/bin/apt-get update',
}

package { 'nginx':
	ensure => 'installed',
	require => Exec['update system']
}

file {'/var/www/html/index.html':
	content => 'Hello World!'
}

exec {'redirect_me':
	command => sudo sed -i '/server_name _;/a \        location /redirect_me { \            return 301 https://github.com/TKaburu; \        }' /etc/nginx/sites-enabled/default

	provider => 'shell'
}

service {'nginx':
	ensure => running,
	require => Package['nginx']
}
