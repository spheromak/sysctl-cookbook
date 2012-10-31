default[:sysctl] ||= {}

default[:sysctl_file] = "/etc/sysctl.conf"
if platform_family == "debian"
  default[:sysctl_file] = "/etc/sysctl.d/99-chef.conf"
end
