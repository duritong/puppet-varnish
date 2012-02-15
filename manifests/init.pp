class varnish {
  
  case $::operatingsystem {
    centos: { include varnish::centos }  
    default: { include varnish::base }
  }

  if hiera('use_munin',false){
    include varnish::munin
  }
}
