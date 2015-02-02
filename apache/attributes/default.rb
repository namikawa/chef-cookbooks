# check to available packages in "file/default/rpms"
default['apache']['rpmfiles'] = %w{
  apr-1.5.1-3.el6.x86_64.rpm
  apr-util-1.5.3-3.el6.x86_64.rpm
  distcache-1.4.5-23.x86_64.rpm
  httpd-2.4.10-1.x86_64.rpm
  httpd-tools-2.4.10-1.x86_64.rpm
  mod_proxy_html-2.4.10-1.x86_64.rpm
  mod_ssl-2.4.10-1.x86_64.rpm
}

default['apache']['User'] = "daemon"
default['apache']['Group'] = "daemon"
default['apache']['ErrorLog'] = "|/usr/sbin/rotatelogs /var/log/httpd/error_log.%Y%m%d_%H 3600 540"
default['apache']['CustomLog'] = "|/usr/sbin/rotatelogs /var/log/httpd/access_log.%Y%m%d_%H 3600 540"


default['apache']['Timeout'] = "30"
default['apache']['KeepAlive'] = "Off"
default['apache']['MaxKeepAliveRequests'] = "150"
default['apache']['KeepAliveTimeout'] = "2"

default['apache']['PidFile'] = "/var/run/httpd.pid"

default['apache']['mpm_event']['StartServers'] = "20"
default['apache']['mpm_event']['ServerLimit'] = "20"
default['apache']['mpm_event']['MinSpareThreads'] = "4000"
default['apache']['mpm_event']['MaxSpareThreads'] = "4000"
default['apache']['mpm_event']['ThreadsPerChild'] = "200"
default['apache']['mpm_event']['ThreadLimit'] = "200"
default['apache']['mpm_event']['MaxRequestWorkers'] = "4000"
default['apache']['mpm_event']['MaxConnectionsPerChild'] = "10000000"

default['apache']['SSLCipherSuite'] = "AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA:RC4-SHA:!aNULL:!MD5;"
default['apache']['SSLProtocol'] = "all -SSLv3"
#default['apache']['SSLSessionCache'] = "memcache:10.0.0.1:11211,10.0.0.2:11211"
default['apache']['SSLSessionCacheTimeout'] = "300"

default['apache']['sslhost']['DocumentRoot'] = "/var/www/html"
default['apache']['sslhost']['ServerName'] = "www.example.com:443"
default['apache']['sslhost']['SSLCertificateFile'] = "/etc/httpd/conf/server.crt"
default['apache']['sslhost']['SSLCertificateKeyFile'] = "/etc/httpd/conf/server.key"

default['apache']['sslhost']['RequestHeader'] = [
  "set X_Forwarded_Proto 'https'",
]
default['apache']['sslhost']['ProxyPass'] = "http://127.0.0.1:8000/ retry=0 timeout=5"
default['apache']['sslhost']['ProxyPassReverse'] = "http://127.0.0.1:8000/"

default['apache']['server-info']['RequireIP'] = [
  "127.0.0.1/32",
  "10.0.0.0/8",
  "172.16.0.0/12",
  "192.168.0.0/16",
]

default['apache']['log']['delete']['interval'] = "+6"
