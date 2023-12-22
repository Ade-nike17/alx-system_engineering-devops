#This script installs nginx web server (w/ Puppet)

package { 'nginx':
    ensure  => installed,
}

file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => "server {
        listen 80 default_server;
        server_name _;

        root /var/www/html;
        index index.html index.htm;

        location /redirect_me {
            rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4;
        }

        location / {
            try_files \$uri \$uri/ =404;
        }
    }",
    require => Package['nginx'],
    notify  => Service['nginx'],
}


file { '/var/www/html/index.html':
    content => 'Hello World!',
}

service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
}