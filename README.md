# blockstorage-lvm cookbook

A cookbook that provisions Rackspace Cloud Block Storage devices and then uses LVM to create logical volumes that are formatted and mounted.  Uses the Rackspacecloud cookbook and the LVM cookbook.

# Attributes

* `default[:rackspace][:cloud][:region]` - The rackspace datacenter in which to provision the storage

Rackspace Cloud Block Storage attributes

* `default[:blockstorage_lvm][:no_volumes]` - The number of cbs volumes to provision
* `default[:blockstorage_lvm][:volume_type]` - The type of volumes to provision, "SATA" or "SSD"
* `default[:blockstorage_lvm][:volume_size]` - The size, in GB, of each volume

LVM attributes

* `default[:blockstorage_lvm][:volume_group_name]` - The name of the LVM volume group
* `default[:blockstorage_lvm][:logical_volume_name]` - The name of the logical volume to be created
* `default[:blockstorage_lvm][:filesystem]` - The type of file system to create on the logical volume,  "ext4"
* `default[:blockstorage_lvm][:mount_point]` = The mount point for the logical volume

# Author

Author:: Steven Gonzales (<steven.gonzales@rackspace.com>)
