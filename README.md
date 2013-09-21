DESCRIPTION
===========
Manage sysctl via a sysctl provider.

NOTE: If you are getting this from the community site it's named jn_sysctl. Due to some internal requirements the metadata sets it's name to "sysctl" this could cause some confusion.

__WARNING:__ The default behavior on non-debian flavors is to write out /etc/sysctl.conf, which if you don't have settings in chef means you can kill your existing config. the __sysctl_file__ atribute can control where this file goes in a role/override if you wish.

Attributes
----------
* __sysctl__:  Hash of k/v pairs with sysctl settings.
* __sysctl_file__: The location we write out the configuration
  defaults to /etc/sysctl.conf on anything not debian flavor
  defaults to /etc/sysctl.d/99-chef.conf on debian

Recipes
---------
* attribute_driver.rb: Reads attributes set in `node[:sysctl][:values]`, and sets sysctl resources with  the values
* default.rb: Simply sets up the resources needed to use the lwrp  
* library.rb: Empty recipe if you want to avoid default, but still want to explicitly include (for whatever reason)

Sysctl LWRP
===========
Properties
----------
* __name__:  The key name. Defaults to the resource name i.e. sysctl "some.key"
* __value__:  what to set this key to
* __save__: save the setting back to the node data (default: false)

Actions
-------
* __:set__  Make sure the running state is set  (default)
* __:write__  Write the config file  (default)


Known Bugs
----------
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
