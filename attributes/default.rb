default[:rackspace][:cloud][:region] = "ord"

#Rackspace Cloud Block Storage attributes
default[:blockstorage_lvm][:no_volumes] = 1
default[:blockstorage_lvm][:volume_type] = "SATA"
default[:blockstorage_lvm][:volume_size] = "100"

#LVM attributes
default[:blockstorage_lvm][:volume_group_name] = "vg00"
default[:blockstorage_lvm][:logical_volume_name] = "blockstoragevolume"
default[:blockstorage_lvm][:filesystem] = "ext4"
default[:blockstorage_lvm][:mount_pount] = "/var/log"
