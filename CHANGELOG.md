Change Log
----------
## 2.0.1
* fix bug where we quote values in the template
* fix kitchen setup
* add some bats integration testing 

## 2.0.0
* move to accumulator cookbook for building the single file
* rearange the way we work with attributes (backward breaking)
* add in basic kitchen and travis work

## 1.3.0
* switch save to node off by efault. This changes the implicit behaviour from previous versions. 
* update the LWRP to use chef 10.12 default_action

## 1.2.1
* update node[:sysctl] = blah to chef 11 node.set[:sysctl] = blah
* bust changelog out from README to its own file
* fix typo in example
* remove unused resource/write.rb

## 1.2.0 
* Default behavior on debian is less destructive

## 1.1.0  
* Adding in :write action support so that it writes /etc/sysctl

## 1.0.2  
* Initial public release

