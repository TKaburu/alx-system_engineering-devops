# client configuration file using puppet

file { 'file_present':
  ensure  => 'present',
  mode    => '0700',
  require => File['/home/your_username/.ssh'],
}

file { 'config_file':
  ensure  => 'file',
  mode    => '0600',
  content => @("END"
    Host 34.229.69.59
        IdentityFile ~/.ssh/school
        PasswordAuthentication no
    END
  ),
  require => File['~/.ssh'],
}
