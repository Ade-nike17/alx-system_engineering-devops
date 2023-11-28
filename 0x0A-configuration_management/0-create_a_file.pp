# This manifest creates a file 'school' at /tmp
file { '/tmp/school':
    ensure  => 'file',
    mode    => '0744',
    owner   => 'www-data',
    group   => 'www-data',
    content => 'I love puppet',
}
