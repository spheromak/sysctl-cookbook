default[:sysctl] = {}
default[:sysctl][:values] = {}

default[:sysctl][:config_file] = '/etc/sysctl.conf'
if platform_family == 'debian'
  default[:sysctl][:config_file] = '/etc/sysctl.d/99-chef.conf'
end
