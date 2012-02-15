class varnish::centos {

  file{'/etc/sysconfig/varnish':
    source => [
      "puppet:///modules/site_varnish/sysconfig/${::fqdn}/varnish",
      'puppet:///modules/site_varnish/sysconfig/varnish',
      'puppet:///modules/varnish/sysconfig/varnish'
    ],
    require => Package['varnish'],
    notify => Service['varnish'],
    owner => root,
    group => 0,
    mode => 0640;
  }
}
