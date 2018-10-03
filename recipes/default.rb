#
# Cookbook:: cassandra-reaper
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'java'

# postgresql_server_install 'PostgreSQL server' do
#   action :install
# end

# cookbook_file '/tmp/reaper_1.2.2_amd64.deb' do
#   source 'reaper_1.2.2_amd64.deb'
#   owner 'root'
#   group 'root'
#   mode '0644'
# end
#
# dpkg_package 'reaper_1.2.2_amd64.deb' do
#   source '/tmp/reaper_1.2.2_amd64.deb'
#   action :install
# end
apt_repository 'reaper' do
  uri 'https://dl.bintray.com/thelastpickle/reaper-deb'
  components ['main']
  distribution 'wheezy'
  key '2895100917357435'
  keyserver 'keyserver.ubuntu.com'
  action :add
end

apt_update

apt_package 'reaper'

passwords = data_bag_item('passwords', 'jmxremote')

template '/etc/cassandra-reaper/cassandra-reaper.yaml' do
  source 'cassandra-reaper.yaml.erb'
  variables(
    :jmxport => "#{node['cassandra']['host']}: #{node['cassandra']['jmx_port']}",
    :jmx_auth => node['cassandra']['jmx_auth'],
    :jmx_user => passwords['jmx_user'],
    :jmx_password => passwords['jmx_password']
  )
end

service 'cassandra-reaper' do
  action :start
end
