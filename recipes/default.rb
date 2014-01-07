#
# Cookbook Name:: blockstorage-lvm
# Recipe:: default
#
# Copyright (C) 2014 Rackspace Hosting <steven.gonzales@rackspace.com>
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'rackspacecloud'
include_recipe 'lvm'

rackspace = data_bag_item("rackspace", "cloud")
rackspace_username = rackspace["rackspace_username"]
rackspace_api_key = rackspace["rackspace_api_key"]

(1..node[:blockstorage_lvm][:no_volumes]).each do |vol_number|
  rackspacecloud_cbs "#{node[:hostname]}-#{vol_number}" do
	  type "SATA"
	  size 100
	  rackspace_username rackspace_username
	  rackspace_api_key rackspace_api_key
	  rackspace_region "#{node[:rackspace][:cloud][:region]}"
	  action :create_and_attach
  end
end

#use lazy attribute evaluation to get attachment data at execution time
lvm_volume_group node[:blockstorage_lvm][:volume_group_name] do
  physical_volumes lazy {node[:rackspacecloud][:cbs][:attached_volumes].collect{|attachment| attachment["device"]}}

  logical_volume node[:blockstorage_lvm][:logical_volume_name] do
    size        '100%VG'
    filesystem  node[:blockstorage_lvm][:filesystem]
    mount_point node[:blockstorage_lvm][:mount_pount]
  end
 end
