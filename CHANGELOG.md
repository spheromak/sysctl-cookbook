Change Log
----------
## 1.2.1
* update node[:sysctl] = blah to chef 11 node.set[:sysctl] = blah
* bust changelog out from README to its own file
* fix typo in example
* remove unused resource/write.rb

## 1.2.0 
* updates the provider to write a file to /etc/sysctl.d/99-chef.conf on debian platforms
* added ability to change file location with node[:sysctl_file] attrib
* moved examples to their own directory

## 1.1.0  
* Adding in :write action support so that it writes /etc/sysctl

## 1.0.2  
* Initial public release

