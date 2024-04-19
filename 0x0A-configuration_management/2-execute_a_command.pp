# Define the exec resource to kill the process named "killmenow"
exec { 'kill_killmenow_process':
  command     => '/usr/bin/pkill -f killmenow',
  refreshonly => true,
}

