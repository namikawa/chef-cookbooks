#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2014, Yuuki NAMIKAWA
#
# All rights reserved - Do Not Redistribute
#

# install
package "gperftools-libs" do
  action :install
end

file = node['redis']['rpmfile']

cookbook_file "/tmp/#{file}" do
  source file
  mode 0644
end 

package "redis" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{file}"
end 

# configuration & service (redis, sentinel)
%w{
  redis
  redis-sentinel
}.each do |srv|
  template "/etc/#{srv}.conf" do
    source "#{srv}.conf.erb"
    user "redis"
    mode 0644
  end

  service srv do
    action :disable
  end
end

# sysctl configuration


# limits.conf


