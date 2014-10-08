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

