require 'chefspec'

runner = ChefSpec::ChefRunner.new do |node|
  node['sysctl'] = {'net.ipv4.tcp_mem' => '8388608 12582912 16777216'}
end


describe 'sysctl::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'sysctl::default' }
  it 'should set syctl paramaters' do
    # right now theres no way to do lwrp in chefspec, 
    # working on that
  end
end
