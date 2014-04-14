########## sysctl ##########
default['sysctl']['allow_sysctl_conf'] = true

default['sysctl']['params']['vm']['swappiness'] = 10
default['sysctl']['params']['vm']['overcommit_memory'] = 1

default['sysctl']['params']['net']['core']['wmem_max'] = 1048576
default['sysctl']['params']['net']['core']['rmem_max'] = 1048576
default['sysctl']['params']['net']['core']['wmem_default'] = 1048576
default['sysctl']['params']['net']['core']['wmem_default'] = 1048576
default['sysctl']['params']['net']['core']['optmem_max'] = 20480
default['sysctl']['params']['net']['core']['somaxconn'] = 1024
default['sysctl']['params']['net']['core']['netdev_max_backlog'] = 2048

default['sysctl']['params']['net']['ipv4']['tcp_rmem'] = "4096 87380 1048576"
default['sysctl']['params']['net']['ipv4']['tcp_wmem'] = "4096 87380 1048576"
default['sysctl']['params']['net']['ipv4']['tcp_mem'] = "1048576 1048576 1048576"

########## limits.conf ##########
default["security"]["limits"]["domains"]["*"] = {
  "nofile" => {
    "soft" => "16384",
    "hard" => "32768",
  },
  "stack" => {
    "soft" => "16384",
    "hard" => "32768",
  }
}

