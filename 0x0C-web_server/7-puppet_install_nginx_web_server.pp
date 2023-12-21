# This script installs nginx web server (w/ puppet)

package { 'nginx':
    ensure => 'installed',
}

file { '/etc/nginx/html':
    ensure => 'directory',
}

file { '/etc/nginx/html/index.html':
    content => 'Hello World!',
    require => File['/etc/nginx/html'],
}

file { '/etc/nginx/sites-available/default':
    content => "server {
        listen 80;
        server_name _;

        root /etc/nginx/html;
        index index.html index.htm;

        location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
        }
    }",
    require => Package ['nginx'],
}

service { 'nginx':
    ensure  => 'running',
    enable  => true,
    require => Package ['nginx'],
}