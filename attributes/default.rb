default['java']['install_flavor'] = 'openjdk'
default['java']['openjdk_packages'] = ['openjdk-8-jre-headless']
default['java']['jdk_version'] = '8'

default['cassandra']['host'] = 'localhost'
default['cassandra']['jmx_port'] = '7199'
default['cassandra']['jmx_auth'] = false
default['cassandra']['cluster_name'] = 'Test Cluster'
default['cassandra']['contact_points'] = ["127.0.0.1"]

default['reaper']['storage_type'] = 'memory'
default['reaper']['datacenter_availability'] = 'ALL'
