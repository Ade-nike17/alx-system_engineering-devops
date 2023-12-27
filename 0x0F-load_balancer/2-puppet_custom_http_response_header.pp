# Adds a custom HTTP header with Puppet
# Execute update
exec { 'apy_update':
  command => '/usr/bin/apt-get update',
}

# Install Nginx
package { 'nginx':
  ensure => 'installed',
}
#include the stdlib module
include stdlib

# Configure Nginx with custom response header
file_line { 'nginx_custom_header':
  path   => '/etc/nginx/sites-available/default',
  line   => 'add_header X-Served-By $hostname;',
  match  => '^server_name _;$',
  after  => 'server_name _;',
  ensure => present,
}

# Restart Nginx to apply changes
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}
