
action :write
attribute :name, :kind_of => String,  :name_attribute => true, :default => "/etc/sysctl.conf"

def initialize(*args)
  super
  @action = :write
end
