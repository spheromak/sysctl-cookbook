# this is just an example remove the returnK if you want to use these settings
#  which are things I use in production
return

# ohai sysctl pulls all these values in as strings, so we do them as strings here so they can match
# bump open files way way high.
default.sysctl['fs.file-max'] = '1000000'

# 256 KB default performs well experimentally, and is often recommended by ISVs.
default.sysctl['net.core.rmem_default'] = '262144'
default.sysctl['net.core.wmem_default'] = '262144'

# When opening a high-bandwidth connection while the receiving end is under
# memory pressure, disk I/O may be necessary to free memory for the socket,
# making disk latency the effective latency for the bandwidth-delay product
# initially.  For 10 Gb ethernet and SCSI, the BDP is about 5 MB.  Allow 8 MB
# to account for overhead, to ensure that new sockets can saturate the medium
# quickly.
default.sysctl['net.core.rmem_max'] = '8388608'
default.sysctl['net.core.wmem_max'] = '8388608'

# Allow a deep backlog for 10 Gb and bonded Gb ethernet connections
default.sysctl['net.core.netdev_max_backlog'] = '10000'

# Always have one page available, plus an extra for overhead, to ensure TCP NFS
# pageout doesn't stall under memory pressure.  Default to max unscaled window,
# plus overhead for rmem, since most LAN sockets won't need to scale.
default.sysctl['net.ipv4.tcp_rmem'] = '8192 87380 8388608'
default.sysctl['net.ipv4.tcp_wmem'] = '8192 87380 8388608'

# Always have enough memory available on a UDP socket for an 8k NFS request,
# plus overhead, to prevent NFS stalling under memory pressure.  16k is still
# low enough that memory fragmentation is unlikely to cause problems.
# if platform_version.to_i >= 5
default.sysctl['net.ipv4.udp_rmem_min'] = '16384'
default.sysctl['net.ipv4.udp_wmem_min'] = '16384'

  # Ensure there's enough memory to actually allocate those massive buffers to a
  # socket.
default.sysctl['net.ipv4.tcp_mem'] = '8388608 12582912 16777216'
default.sysctl['net.ipv4.udp_mem'] = '8388608 12582912 16777216'
# end

# Decrease the time default value for tcp_fin_timeout connection
default.sysctl['net.ipv4.tcp_fin_timeout'] = '30'

# Decrease the time default value for tcp_keepalive_time connection
default.sysctl['net.ipv4.tcp_keepalive_time'] = '1800'

# support large window scaling RFC 1323
default.sysctl['net.ipv4.tcp_window_scaling'] = 1

# syn cookie flood controll enable (blocks a trivial dos)
default.sysctl['net.ipv4.tcp_syncookies'] = 1

# Filesystem I/O is usually much more efficient than swapping, so try to keep
# swapping low.  It's usually safe to go even lower than this on systems with
# server-grade storage.
default.sysctl['vm.swappiness'] = '0'

# If a workload mostly uses anonymous memory and it hits this limit, the entire
# working set is buffered for I/O, and any more write buffering would require
# swapping, so it's time to throttle writes until I/O can catch up.  Workloads
# that mostly use file mappings may be able to use even higher values.
default.sysctl['vm.dirty_ratio'] = '50'

# Ensure there's always some easily-dropped pagecache if the system is under
# memory pressure from cached files, since it's much faster to page back in than
# swap.
# default.sysctl["vm.pagecache"] = "90" unless node.kernel.release == "2.6.9-42.ELsmp" # don't do this on this kern

# Controls the System Request debugging functionality of the kernel
default.sysctl['kernel.sysrq'] = 1

# reboot on panic
default.sysctl['kernel.panic'] = 30
