class varnish {
  
  case $::operatingsystem {
    centos: { include varnish::centos }  
    default: { include varnish::base }
  }
}
