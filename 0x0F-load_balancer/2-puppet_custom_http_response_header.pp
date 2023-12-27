# Adds a custom HTTP header with Puppet

# Install Nginx
package { 'nginx':
  ensure => 'installed',
}

# Create directory and index.html file
file { '/etc/nginx/html':
  ensure => 'directory',
}

file { '/etc/nginx/html/index.html':
  content => 'Hello World!',
  require => File['/etc/nginx/html'],
}

# Create 404.html file
file { '/etc/nginx/html/404.html':
  content => "Ceci n'est pas une page",
}

# Configure Nginx with custom response header
file { '/etc/nginx/sites-available/default':
  content => "server {
    listen 80;
    listen [::]:80 default_server;
    root    /etc/nginx/html;
    index   index.html index.htm;

    # Custom HTTP response header
    add_header X-Served-By $hostname;

    error_page 404 /404.html;
    location = /404 {
      root /etc/nginx/html;
      internal;
    }
  }",
  notify  => Service['nginx'],
}

# Restart Nginx to apply changes
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}
