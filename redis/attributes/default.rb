default['redis']['rpmfile'] = "redis-2.8.7-1.el6.x86_64.rpm"

##### redis.conf #####
default['redis']['pidfile'] = "/var/run/redis/redis.pid"
default['redis']['port'] = "6379"
default['redis']['tcp-backlog'] = "511"
default['redis']['bind'] = "0.0.0.0"
default['redis']['timeout'] = "0"
default['redis']['tcp-keepalive'] = "0"

default['redis']['loglevel'] = "notice"
default['redis']['logfile'] = "/var/log/redis/redis.log"
default['redis']['syslog-enabled'] = "no"
default['redis']['syslog-ident'] = "redis"
default['redis']['syslog-facility'] = "local0"
default['redis']['databases'] = "16"

default['redis']['save'] = [
  "900 1",
  "300 10",
  "60 10000",
]
default['redis']['stop-writes-on-bgsave-error'] = "yes"
default['redis']['rdbcompression'] = "yes"
default['redis']['rdbchecksum'] = "yes"
default['redis']['dbfilename'] = "dump.rdb"
default['redis']['dir'] = "/var/lib/redis"

# 認証を行う場合は、以下attributeの設定を行う
# default['redis']['masterauth'] = "master-password"

default['redis']['slave-serve-stale-data'] = "yes"
default['redis']['slave-read-only'] = "yes"

default['redis']['maxclients'] = "10000"

# maxmemoryのattributeをNilとした場合、搭載メモリの70%を割り当てる設定を行う
default['redis']['maxmemory'] = Nil

##### redis-sentinel.conf #####
default['redis-sentinel']['port'] = "26379"
default['redis-sentinel']['bind'] = "0.0.0.0"
default['redis-sentinel']['logfile'] = "/var/log/redis/sentinel.log"
default['redis-sentinel']['pidfile'] = "/var/run/redis/sentinel.pid"

default['redis-sentinel']['master']['name'] = "mymaster"
default['redis-sentinel']['master']['host'] = "127.0.0.1"
default['redis-sentinel']['master']['port'] = "6379"
default['redis-sentinel']['quorum'] = "2"
default['redis-sentinel']['down-after-milliseconds'] = "10000"
default['redis-sentinel']['failover-timeout'] = "600000"
default['redis-sentinel']['parallel-syncs'] = "1"

