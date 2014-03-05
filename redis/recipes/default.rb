#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2014, Yuuki NAMIKAWA
#
# All rights reserved - Do Not Redistribute
#

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


