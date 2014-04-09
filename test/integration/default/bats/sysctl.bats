# vim: set ft=sh:

@test "sysctl should work" {
  sysctl -a
}

@test "we should have set net.core.rmem_default" {
  out=`sysctl net.core.rmem_default`
  [ "net.core.rmem_default = 262144" == "$out" ]
}
