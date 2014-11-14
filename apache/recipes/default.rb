#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, Yuuki NAMIKAWA
#
# All rights reserved - Do Not Redistribute
#

# install
%w{
  mailcap
  openssl
}.each do |pkg|
  package pkg do
    action :install
  end
end

node['apache']['rpmfiles'].each do |file|
  cookbook_file "/tmp/#{file}" do
    source "rpms/#{file}"
    mode 0644
  end

  package file do
    action :install
    provider Chef::Provider::Package::Rpm
    source "/tmp/#{file}"
  end
end

# config
template "/etc/httpd/conf/httpd.conf" do
  source "etc/httpd/conf/httpd.conf.erb"
  mode "0644"
end

%w{
  httpd-default.conf
  httpd-info.conf
  httpd-mpm.conf
  httpd-ssl.conf
}.each do |file|
  template "/etc/httpd/conf/extra/#{file}" do
    source "etc/httpd/conf/extra/#{file}.erb"
    mode "0644"
  end
end

directory "/var/www/icons" do
  recursive true
  action :delete
end

file "/var/www/html/index.html" do
  action :delete
end

# service
service "httpd" do
  action :disable
end

# cron
cron "compress logs" do
  minute '5'
  command "/bin/find /var/log/httpd -regextype posix-egrep -type f -mmin '+60' -regex '*.*[^gz|^pid]$' -exec /bin/gzip -9 {} \\;"
end

mtime = node['apache']['log']['delete']['interval']
cron "delete logs" do
  hour '5'
  minute '30'
  command "/bin/find /var/log/httpd -regextype posix-egrep -type f -mtime '#{mtime}' -regex '*.*[^pid]$' -exec rm -f {} \\;"
end
