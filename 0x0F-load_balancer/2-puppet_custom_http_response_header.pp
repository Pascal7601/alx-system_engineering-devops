#configures a server

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Define a custom fact to retrieve the hostname of the server
Facter.add('server_hostname') do
  setcode 'hostname'
end

# Define an Nginx configuration file
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => "
    server {
      listen 80 default_server;
      listen [::]:80 default_server;

      root /var/www/html;
      index index.html index.htm index.nginx-debian.html;

      server_name _;

      location / {
        try_files \$uri \$uri/ =404;
      }

      # Add custom HTTP header
      add_header X-Served-By $::server_hostname;
    }
  ",
  notify  => Service['nginx'],
}

# Enable the Nginx server block
file { '/etc/nginx/sites-enabled/custom_header':
  ensure  => link,
  target  => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
  notify  => Service['nginx'],
}

# Restart Nginx service
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/sites-available/default'],
}

