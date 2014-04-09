DESCRIPTION
===========
Manage sysctl via a sysctl LWRP.


Attributes
----------

| Name | Value | Description
|:---|:---|:--------
|`default[:sysctl][:values]` | {}  | Hash Of Key Value pairs the attribute_driver recipe uses.
|`default[:sysctl][:config_file]` | rhel: `"/etc/sysctl.conf"` debian: `"/etc/sysctl.d/99-chef.conf"` | The file to write values to.

Recipes
---------

| Name | Description |
|:-----|:------------|
|attribute_driver.rb| Reads attributes set in `node[:sysctl][:values]`, and sets sysctl resources with  the values
|default.rb| Simply sets up the resources needed to use the lwrp
|library.rb| Empty recipe if you want to avoid default, but still want to explicitly include (for whatever reason)

Sysctl LWRP
===========


Attributes
----------
| Name | Type | Default | Description   |
|:-----|:-----|:--------|:--------------|
| `name` | `String` | `:name_attribute` |The key name. Defaults to the resource name i.e. sysctl "some.key"
| `value`| `String`, `Fixnum`, `Integer` | The Value for this key
| `save` | boolean | `true` | save the setting back to the node data (default: false)

Actions
-------
| action | default | Description|
|:-------|:--------|:-----------|
| `:set` |  yes | Make sure the running state is set  (default)
| `:write`| yes |  Write the config file  (default)


 Known Bugs
 ----------
 * RHEL/CentOS 6 now have sysctl.d Directory, we should generate a config in this dir instead
 * only intended to be used on Linux


Example Usage
=============
LWRP
----
Ensure running state, and write this key to sysctl.conf

    sysctl "kernel.sysrq" do
       value 1
    end

__Check out__ [example/recipes/example.rb] [2] For more recipe examples.

ChefSpec Matchers
=================
There are chefspec matchers in this cookbook to test your usage of the lwrp

set_sysctl
----------
matcher for the set action

write_sysctl
------------
matcher for the write action



Attributes
----------
In a role attribute or override:

    {
      "sysctl": {
        "net.ipv4.tcp_window_scaling": 0
      }
    }


__Check out__ [example/attributes/example.rb] [1] For more attribute examples.


Author and License
===================

__Author__ Jesse Nelson <spheromak@gmail.com>

Copyright 2011-2013, Jesse Nelson

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.



[1]: https://github.com/spheromak/cookbooks/blob/master/sysctl/example/attributes/example.rb
[2]: https://github.com/spheromak/cookbooks/blob/master/sysctl/example/recipes/example.rb
