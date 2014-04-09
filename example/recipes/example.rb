
#
# !!!!! NOTE: !!!!!!! This thing overwrites sysctl.conf so if its not in chef it's toast from that file
#

# basic config
# by default with :write, :set
# and store the value in node[:sysctl] so you can do searches on it
sysctl 'fs.file-max' do
  value 110_000
end

# write this param to /etc/sysctl.conf
# Usefull when you are doing a kernel update or something else
sysctl 'fs.file-max' do
  action :write # just write this out to config
  value 5000  # set the value
  save false # not store in node[:sysctl]
end

# whee
sysctl 'net.ipv4.ip_forward' do  value 0  end
