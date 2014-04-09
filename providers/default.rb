# Cookbook Name:: sysctl
# Provider:: sysctl
# Author:: Jesse Nelson <spheromak@gmail.com>
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
require 'chef/mixin/command.rb'
include Chef::Mixin::Command

def initialize(*args)
  super
  status, output, error_message = output_of_command('which sysctl', {})
  unless status.exitstatus == 0
    Command.handle_command_failures(status, "STDOUT: #{output}\nSTDERR: #{error_message}")
  end

  @sysctl = output.chomp
end

# sysctl -n -e  only works on linux  (-e at least is missing on mac)
# side effect is that these calls will always try to set/write on other platforms.
# This is ok for now, but prob need to do detection at some point.
# TODO: Make this work on other platforms better
def load_current_resource
  # quick & dirty os detection
  @sysctl_args = case node[:os]
                 when 'GNU/Linux', 'Linux', 'linux'
                  '-n -e'
                 else
                   '-n'
                 end

  # clean up value whitespace when its a string
  @new_resource.value.strip!  if @new_resource.value.class == String

  # find current value
  _status, @current_value, _error_message = output_of_command(
      "#{@sysctl} #{@sysctl_args} #{@new_resource.name}", ignore_failure: true)

  Chef::Log.info "#{new_resource.name} -> #{@current_value} := #{new_resource.value}"
end

# save to node obj if we were asked to
def save_to_node
  node.set[:sysctl][:values][@new_resource.name]  = @new_resource.value if @new_resource.save == true
end

# ensure running state
action :set do
  # heavy handed type enforcement only wnat to write if they are different  ignore inner whitespace
  if @current_value.to_s.strip.split != @new_resource.value.to_s.strip.split
    # run it
    run_command(command: "#{@sysctl} #{@sysctl_args} -w #{@new_resource.name}='#{@new_resource.value}'")
    save_to_node
    # let chef know its done
    @new_resource.updated_by_last_action true
  end
end

# write out a config file
action :write do
  # Implemented using the "accumulator" cook
end
