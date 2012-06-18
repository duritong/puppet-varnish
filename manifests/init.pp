class varnish(
  $manage_munin = false
) {
  
  case $::operatingsystem {
    centos: { include varnish::centos }  
    default: { include varnish::base }
  }

  if $manage_munin {
    include varnish::munin
  }
}
