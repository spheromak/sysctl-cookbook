#
# Cookbook Name:: sysctl
# Recipe:: writer
# Author:: jesse nelson <spheromak@gmail.com>
#
# This recipe writes a config to your platform sysctl.conf or sysctl.conf.d
#
# Copyright 2011, Jesse Nelson
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

template node[:sysctl][:config_file] do
  action :nothing
  source 'sysctl.erb'
  owner 'root'
  group 'root'
  mode 0644
  variables(sysctl_entries: Array.new)
end

accumulator 'sysctl.conf' do
  target template: node[:sysctl][:config_file]
  filter { |resource| resource.is_a? Chef::Resource::Sysctl }
  transform do |resources|
    list = Array.new
    list = resources.map { |r| r if  r.action.include?(:write) }
    list.compact.sort_by { |r| r.name }
  end
  variable_name :sysctl_entries
end
