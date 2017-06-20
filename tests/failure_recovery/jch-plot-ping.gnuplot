protocols="BABEL BATMAN4 BMX7 BMX7TUN OLSRv1 OLSRv2"

tests="failuretest-node8-fc00:17::1 failuretest-node8-fc00:2::1 failuretest-node9-fc00:17::1 failuretest-node9-fc00:2::1"

set terminal pdf

do for [test in tests] {
  set output '../../report/images/scatter-'.test.'.pdf'
  plot [0:100] [0:200] for [prot in protocols] 'delay-one-run/'.prot.'/'.test.'.txt.dat' title prot
  set output '../../report/images/cdf-'.test.'.pdf'
  plot [0:50] [0:1] for [prot in protocols] 'delay-one-run/'.prot.'/'.test.'.txt.dat' using 1:(1/100.) smooth cumulative title prot
}
