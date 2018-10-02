#
# Cookbook:: cassandra-reaper
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'java'

# postgresql_server_install 'PostgreSQL server' do
#   action :install
# end

cookbook_file '/tmp/reaper_1.2.2_amd64.deb' do
  source 'reaper_1.2.2_amd64.deb'
  owner 'root'
  group 'root'
  mode '0644'
end

dpkg_package 'reaper_1.2.2_amd64.deb' do
  source '/tmp/reaper_1.2.2_amd64.deb'
  action :install
end

service 'cassandra-reaper' do
  action :start
end
