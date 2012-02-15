class varnish::base {

  package{'varnish':
    ensure => present,
  }

  file{'/etc/varnish/default.vcl':
    source => [
      "puppet:///modules/site_varnish/config/${::fqdn}/default.vcl",
      "puppet:///modules/site_varnish/config/default.vcl",
      "puppet:///modules/varnish/config/default.vcl"
    ],
    require => Package['varnish'],
    notify => Service['varnish'],
    owner => root,
    group => 0,
    mode => 0640;
  }

  service{'varnish':
    ensure => running,
    enable => true,
  }
  
}
