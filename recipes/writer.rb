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
  source "sysctl.erb"
  owner "root"
  group "root"
  mode  0644
  variables( :sysctl_entries => [] )
end

accumulator "sysctl.conf" do
  filter Proc.new { |resource| resource.is_a? Chef::Resource::Sysctl}
  target :template => node[:sysctl][:config_file]
  transform Proc.new { |resources| resources.sort_by {|r| r.name } }
  variable_name :sysctl_entries
end
