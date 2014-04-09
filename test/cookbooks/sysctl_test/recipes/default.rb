node.set[:sysctl][:values]= {
  "net.ipv4.conf.default.rp_filter" => 1,
  "net.ipv4.conf.default.accept_source_route" => 0
}

include_recipe "sysctl::attribute_driver"

sysctl "fs.file-max" do
  action [:write, :set]
  value 110000
  save true
end

sysctl "fs.file-max" do
  action :write # just write this out to config
  value 5000  # set the value
  save  false # not store in node[:sysctl]
end

sysctl "net.ipv4.ip_forward" do  
  value 0  
end


